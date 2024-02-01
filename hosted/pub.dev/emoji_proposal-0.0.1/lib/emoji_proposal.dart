library emoji_proposal;

import 'package:emojis/emoji.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

/// proposes (hopefully) suitable [Emoji] reactions for a given [message].
///
/// By providing [languageCodes], you can specify the languages to analyze.
Set<Emoji> proposeEmojis(
  String message, {
  int? number,
  Set<EmojiProposalLanguageCodes> languageCodes = const {
    EmojiProposalLanguageCodes.en
  },
}) {
  Set<Emoji> proposedEmojis = {};
  for (final language in languageCodes) {
    Set<Emoji> proposedBetterEmojis = {};
    Set<Emoji> proposedWorseEmojis = {};
    final analysis = Sentiment.analysis(
      message,
      emoji: true,
      languageCode: language.name,
    );
    if (analysis.words.bad.isNotEmpty || analysis.words.good.isNotEmpty) {
      final upperBound = analysis.score.ceil();
      proposedBetterEmojis.addAll(
        _filterEmojisByScore(upperBound),
      );
      if (analysis.score.floor() != analysis.score) {
        final lowerBound = analysis.score.ceil() - 1;
        proposedWorseEmojis.addAll(
          _filterEmojisByScore(lowerBound),
        );
        final share = analysis.score - analysis.score.floor();
        proposedEmojis.addAll(_mergeSetsByShare(number,
            share: share, a: proposedBetterEmojis, b: proposedWorseEmojis));
      } else {
        if (number != null) {
          int range = number;
          if (range > proposedBetterEmojis.length) {
            range = proposedBetterEmojis.length;
          }
          proposedEmojis
              .addAll(proposedBetterEmojis.toList().getRange(0, range));
        } else {
          proposedEmojis.addAll(proposedBetterEmojis);
        }
      }
    }
  }
  return proposedEmojis;
}

Set<Emoji> _mergeSetsByShare(int? count,
    {required double share, required Set<Emoji> a, required Set<Emoji> b}) {
  if (count != null) {
    final sizeA = (count * share).round();
    final sizeB = count - sizeA;
    final List<Emoji> listA = [...a].getRange(0, sizeA).toList();
    final List<Emoji> listB = [...b].getRange(0, sizeB).toList();
    return List.generate(count, (index) {
      return ((!index.isOdd) ? listA : listB).removeAt(0);
    }).toSet();
  } else {
    final List<Emoji> listA = [...a];
    final List<Emoji> listB = [...b];
    return List.generate(a.length + b.length, (index) {
      return ((!index.isOdd) ? listA : listB).removeAt(0);
    }).toSet();
  }
}

/// provides all emojis for the given [score]
List<Emoji> _filterEmojisByScore(num score) {
  if (score > 4) score = 4;
  if (score < -3) score = -3;
  return List.from(
    Sentiment.emojiScores.keys
        .where((element) => Sentiment.emojiScores[element] == score)
        .map((e) => Emoji.byChar(e))
        .where((element) => element != null),
  );
}

/// represents the supported language codes for the text analysis
enum EmojiProposalLanguageCodes { en, it, fr, de }
