/*
 * Copyright (c) 2016, Michael Mitterer (office@mikemitterer.at),
 * IT-Consulting and Development Limited.
 *
 * All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

part of latlong2;

class Vincenty implements DistanceCalculator {
  // final Logger _logger = new Logger('latlong2.Vincenty');

  const Vincenty();

  /// Calculates distance with Vincenty algorithm.
  ///
  /// Accuracy is about 0.5mm
  /// More on [Wikipedia](https://en.wikipedia.org/wiki/Vincenty%27s_formulae)
  @override
  double distance(final LatLng p1, final LatLng p2) {
    var a = equatorRadius,
        b = polarRadius,
        f = flattening; // WGS-84 ellipsoid params

    var l = p2.longitudeInRad - p1.longitudeInRad;
    var u1 = math.atan((1 - f) * math.tan(p1.latitudeInRad));
    var u2 = math.atan((1 - f) * math.tan(p2.latitudeInRad));
    var sinU1 = math.sin(u1), cosU1 = math.cos(u1);
    var sinU2 = math.sin(u2), cosU2 = math.cos(u2);

    double sinLambda,
        cosLambda,
        sinSigma,
        cosSigma,
        sigma,
        sinAlpha,
        cosSqAlpha,
        cos2SigmaM;
    double lambda = l, lambdaP;
    var maxIterations = 200;

    do {
      sinLambda = math.sin(lambda);
      cosLambda = math.cos(lambda);
      sinSigma = math.sqrt((cosU2 * sinLambda) * (cosU2 * sinLambda) +
          (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda) *
              (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda));

      if (sinSigma == 0) {
        return 0.0; // co-incident points
      }

      cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
      sigma = math.atan2(sinSigma, cosSigma);
      sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
      cosSqAlpha = 1 - sinAlpha * sinAlpha;
      cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;

      if (cos2SigmaM.isNaN) {
        cos2SigmaM = 0.0; // equatorial line: cosSqAlpha=0 (§6)
      }

      var C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));
      lambdaP = lambda;
      lambda = l +
          (1 - C) *
              f *
              sinAlpha *
              (sigma +
                  C *
                      sinSigma *
                      (cos2SigmaM +
                          C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));
    } while ((lambda - lambdaP).abs() > 1e-12 && --maxIterations > 0);

    if (maxIterations == 0) {
      throw StateError('Distance calculation faild to converge!');
    }

    var uSq = cosSqAlpha * (a * a - b * b) / (b * b);
    var A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
    var B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));
    var deltaSigma = B *
        sinSigma *
        (cos2SigmaM +
            B /
                4 *
                (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) -
                    B /
                        6 *
                        cos2SigmaM *
                        (-3 + 4 * sinSigma * sinSigma) *
                        (-3 + 4 * cos2SigmaM * cos2SigmaM)));

    var dist = b * A * (sigma - deltaSigma);

    return dist;
  }

  /// Vincenty inverse calculation
  ///
  /// More on [Wikipedia](https://en.wikipedia.org/wiki/Vincenty%27s_formulae)
  @override
  LatLng offset(
      final LatLng from, final double distanceInMeter, final double bearing) {
    final equatorialRadius = equatorRadius;

    final latitude = from.latitudeInRad;
    final longitude = from.longitudeInRad;

    final alpha1 = degToRadian(bearing);
    final sinAlpha1 = math.sin(alpha1);
    final cosAlpha1 = math.cos(alpha1);

    final tanU1 = (1 - flattening) * math.tan(latitude);
    final cosU1 = 1 / math.sqrt((1 + tanU1 * tanU1));
    final sinU1 = tanU1 * cosU1;

    final sigma1 = math.atan2(tanU1, cosAlpha1);
    final sinAlpha = cosU1 * sinAlpha1;
    final cosSqAlpha = 1 - sinAlpha * sinAlpha;
    final dfUSq = cosSqAlpha *
        (equatorialRadius * equatorialRadius - polarRadius * polarRadius) /
        (polarRadius * polarRadius);
    final a = 1 +
        dfUSq / 16384 * (4096 + dfUSq * (-768 + dfUSq * (320 - 175 * dfUSq)));
    final b = dfUSq / 1024 * (256 + dfUSq * (-128 + dfUSq * (74 - 47 * dfUSq)));

    var sigma = distanceInMeter / (polarRadius * a);
    var sigmaP = 2 * pi;

    var sinSigma = 0.0;
    var cosSigma = 0.0;
    var cos2SigmaM = 0.0;
    double deltaSigma;
    var maxIterations = 200;

    do {
      cos2SigmaM = math.cos(2 * sigma1 + sigma);
      sinSigma = math.sin(sigma);
      cosSigma = math.cos(sigma);
      deltaSigma = b *
          sinSigma *
          (cos2SigmaM +
              b /
                  4 *
                  (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) -
                      b /
                          6 *
                          cos2SigmaM *
                          (-3 + 4 * sinSigma * sinSigma) *
                          (-3 + 4 * cos2SigmaM * cos2SigmaM)));
      sigmaP = sigma;
      sigma = distanceInMeter / (polarRadius * a) + deltaSigma;
    } while ((sigma - sigmaP).abs() > 1e-12 && --maxIterations > 0);

    if (maxIterations == 0) {
      throw StateError('offset calculation faild to converge!');
    }

    final tmp = sinU1 * sinSigma - cosU1 * cosSigma * cosAlpha1;
    final lat2 = math.atan2(sinU1 * cosSigma + cosU1 * sinSigma * cosAlpha1,
        (1 - flattening) * math.sqrt(sinAlpha * sinAlpha + tmp * tmp));

    final lambda = math.atan2(
        sinSigma * sinAlpha1, cosU1 * cosSigma - sinU1 * sinSigma * cosAlpha1);
    final c =
        flattening / 16 * cosSqAlpha * (4 + flattening * (4 - 3 * cosSqAlpha));
    final l = lambda -
        (1 - c) *
            flattening *
            sinAlpha *
            (sigma +
                c *
                    sinSigma *
                    (cos2SigmaM +
                        c * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));

    var lon2 = longitude + l;
    // print("LA ${radianToDeg(lat2)}, LO ${radianToDeg(lon2)}");

    if (lon2 > pi) {
      lon2 = lon2 - 2 * pi;
    }
    if (lon2 < -1 * pi) {
      lon2 = lon2 + 2 * pi;
    }

    return LatLng(radianToDeg(lat2), radianToDeg(lon2));
  }

  //- private -----------------------------------------------------------------------------------
}
