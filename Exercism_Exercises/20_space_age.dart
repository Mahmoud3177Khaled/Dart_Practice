class SpaceAge {
  double age({ required String planet, required double seconds}) {

    double earth_age = seconds/31557600;

    Map planet_factors = {
      "Mercury" : 0.2408467,
      "Venus" : 0.61519726,
      "Earth" : 1,
      "Mars" : 1.8808158,
      "Jupiter" : 11.862615,
      "Saturn" : 29.447498,
      "Uranus" : 84.016846,
      "Neptune" : 164.79132

    };

    return double.parse((earth_age/planet_factors[planet]).toStringAsFixed(2));
    
  }
}
