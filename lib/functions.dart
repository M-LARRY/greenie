import 'dart:convert';
import 'dart:math';

// DEBUG FUNCTIONS

// random light reading
Future<int> readLightSensor() async {
  return Random().nextInt(100);
}

// placeholder plant collection data
Future<Map<String, dynamic>> getCollection({required String userId}) async {
  String jsonString =
      '{"id": "12345","collection_size":"2","plant_collection": {"0":{"name": "basil","species":"basil","image_uri" : "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.plant-lore.com%2Fwp-content%2Fuploads%2F2010%2F12%2F2014-07-28-12.26.52.jpg&f=1&nofb=1&ipt=27696e9430eb5b078e2e1856eeaa15a82a54d23a3b7988dd416d76322200ae5e&ipo=images","light_exposition": "shade","location": "Rome","care_instructions": "Ah, basil in the Roman shade! It\'s a lovely thought, but basil does love sunshine. Keeping it in the shade will definitely affect its growth and flavor. Here\'s what you can do to make the best of it: **Light:** * **Find the brightest spot possible:** While full sun (6+ hours) is ideal, even partial shade (4-6 hours) can help. Look for spots that get morning sun and some afternoon dappled light. * **Consider supplementing with grow lights:** If your space lacks any natural light, invest in a good quality grow light to mimic sunlight. **Watering:** * **Water deeply but infrequently:**  Basil prefers its soil to dry out slightly between waterings. Overwatering can lead to root rot, especially in shade where the soil takes longer to dry. * **Check the soil moisture:** Stick your finger about an inch into the soil. If it feels dry, it\'s time to water. **Fertilizing:** * **Feed regularly:** Basil is a heavy feeder and needs regular fertilization in the shade to compensate for less sunlight. Use a balanced liquid fertilizer diluted to half strength every two weeks. **Other care tips:** * **Pinch back regularly:** This encourages bushy growth and prevents your basil from becoming leggy and weak. * **Harvest frequently:**  This also promotes bushier growth and prevents your plant from flowering prematurely (which can make the leaves taste bitter). * **Prune any yellowing or damaged leaves:** This helps keep your plant healthy and encourages new growth. **Remember:** Even with these tips, shade-grown basil might not be as flavorful or prolific as its sun-loving counterpart.  But with proper care, you can still enjoy fresh basil throughout the season! Let me know if you have any other questions. Buon appetito!"}, "1":{"name": "mint","species":"mint","image_uri": "https://a-z-animals.com/media/2022/09/Shutterstock_2107398803.jpg","light_exposition": "direct sunlight","location": "Rome","care_instructions": "Lorem ipsum dolor sit amet..."}}}';
  return jsonDecode(jsonString);
}
