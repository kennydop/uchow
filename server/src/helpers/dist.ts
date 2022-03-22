// static getDistanceFromLatLonInKm(lat1: number, lon1: number, lat2: number, lon2: number): number {
//   var deg2Rad = deg => {
//       return deg * Math.PI / 180;
//   }

//   var r = 6371; // Radius of the earth in km
//   var dLat = deg2Rad(lat2 - lat1);
//   var dLon = deg2Rad(lon2 - lon1);
//   var a =
//       Math.sin(dLat / 2) * Math.sin(dLat / 2) +
//       Math.cos(deg2Rad(lat1)) * Math.cos(deg2Rad(lat2)) *
//       Math.sin(dLon / 2) * Math.sin(dLon / 2);
//   var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
//   var d = r * c; // Distance in km
//   return d;
// }
function distance(
  lat1: number,
  lon1: number,
  lat2: number,
  lon2: number
): number {
  var p = 0.017453292519943295; // Math.PI / 180
  var c = Math.cos;
  var a =
    0.5 -
    c((lat2 - lat1) * p) / 2 +
    (c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p))) / 2;

  return 12742 * Math.asin(Math.sqrt(a)); // 2 * R; R = 6371 km
}

// query for restaurants in that City
// check distance between each restaurant and user location removing far away restaurants
// query for foods from left restaurants
