import '../image/image.dart';
import '../util/binary_quantizer.dart';
import '../util/neural_quantizer.dart';
import '../util/octree_quantizer.dart';
import '../util/quantizer.dart';
import 'dither_image.dart';

enum QuantizeMethod { neuralNet, octree, binary }

/// Quantize the number of colors in image to 256.
Image quantize(Image src,
    {int numberOfColors = 256,
    QuantizeMethod method = QuantizeMethod.neuralNet,
    DitherKernel dither = DitherKernel.none,
    bool ditherSerpentine = false}) {
  Quantizer quantizer;

  if (method == QuantizeMethod.octree || numberOfColors < 4) {
    quantizer = OctreeQuantizer(src, numberOfColors: numberOfColors);
  } else if (method == QuantizeMethod.neuralNet) {
    quantizer = NeuralQuantizer(src, numberOfColors: numberOfColors);
  } else {
    quantizer = BinaryQuantizer();
  }

  return ditherImage(src,
      quantizer: quantizer, kernel: dither, serpentine: ditherSerpentine);
}
