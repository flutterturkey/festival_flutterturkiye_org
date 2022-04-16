'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "e6c102e67f03fa19a9a48bd0690deb7a",
"index.html": "2faf9dd39fbea0f38970adcd1a006240",
"/": "2faf9dd39fbea0f38970adcd1a006240",
"favicon.png": "984542880c9a626c99c8984baa3f5c29",
"assets/fonts/Manrope-Light.ttf": "8a28ab731b16cc9423d5d0a8555c9228",
"assets/fonts/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/fonts/Manrope-Bold.ttf": "98ea53ab8548a5f9e984dd93a94e07c4",
"assets/fonts/Manrope-SemiBold.ttf": "e03737a9e201df701880f20f727b90dc",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/fonts/Manrope-ExtraBold.ttf": "9a4548b7ec8765f156ad01e9999b24ef",
"assets/fonts/Manrope-Medium.ttf": "9846b3db6e4eec04b6f956169f65b3aa",
"assets/fonts/Manrope-Regular.ttf": "a9faa3e7843c86bd8693aa685101332b",
"assets/fonts/Manrope-ExtraLight.ttf": "fc31f26b4b217f3af2aa6c103a3c45d8",
"assets/AssetManifest.json": "704c19eb2d6a4b8f47bae8b1b611754c",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "b62641afc9ab487008e996a5c5865e56",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "e5f189376d751fa6cf98e1dd848daced",
"assets/assets/images/speakers/team_kraken.jpg": "a699ec9a9bb95ae512561f1a2c09a0fd",
"assets/assets/images/speakers/abdullah_oguz.png": "b4b2ae8d40aeeb04d1839c95a2b4ae6e",
"assets/assets/images/speakers/mehmet_ali_bayram.jpeg": "2a4c4bddd4eaa963dbcae725202333a5",
"assets/assets/images/speakers/murat_tekin.jpeg": "ebed6b8529db05e431c775ff42156b79",
"assets/assets/images/speakers/nilay_yener.jpeg": "973d8a2bb15b508b064c1072394af256",
"assets/assets/images/speakers/ashita_prasad.jpeg": "a41f2631a78819abb104fecc9d858f01",
"assets/assets/images/speakers/berat_goktug_ozdemir.png": "698124da3734a7a557a9b7a1e4bbb740",
"assets/assets/images/speakers/roaa_khaddam.png": "2ce75e27eceb2a4c5b19ae469a8e6ae2",
"assets/assets/images/speakers/mangirdas_kazlauskas.jpeg": "89044046916031e929d6c1eae6fb7852",
"assets/assets/images/speakers/fatih_demir.jpeg": "9167aff1515c2ea4c33da442ba9b42c9",
"assets/assets/images/speakers/samet_cilingir.jpeg": "d3d6e56c3c6e53b431230eca7574e738",
"assets/assets/images/speakers/yunus_emre_bakir.jpeg": "3c22f09eb65d23c4a9235546dc7e8120",
"assets/assets/images/speakers/gurkan_fikret_gunak.jpeg": "f7082e49568e90a87e8aa8bf9e43e653",
"assets/assets/images/speakers/gazihan_alankus.jpeg": "aeb1e4eed89340ae736819b159e5d162",
"assets/assets/images/speakers/gizem_malcok.jpeg": "ffcc4948dfd695cc2164e67cb9f7a10f",
"assets/assets/images/speakers/levent_kantaroglu.png": "8c5a488ba884673fca9e90d0d2da3622",
"assets/assets/images/speakers/volkan_agaoglu.jpg": "3f41c7e63a427ba74f52c08892064d98",
"assets/assets/images/speakers/ismail_gorkem_gunes.jpeg": "f789c0b4b611ba14b9dbe15b5a6df02f",
"assets/assets/images/speakers/mirsaid_ismailov.jpeg": "bc4a7c0ca9c44b9a7bdd8cc1b09d8611",
"assets/assets/images/speakers/emir_bostanci.jpeg": "55521dbd59765babab7dcd8858c57b78",
"assets/assets/images/speakers/mikail_kose.jpeg": "868cf6a0bd8d8d2a18de951a39bf000f",
"assets/assets/images/speakers/dashatar.png": "4d9d2ca358ce574726d358409484a00f",
"assets/assets/images/speakers/kadriye_macit.jpg": "ca5c4db56dcf9aba2801264e53a39b65",
"assets/assets/images/footer_bg.jpg": "16489d16bd8133b7d63b275dd26ecd1e",
"assets/assets/images/flags/en.png": "0fcced5950ccb4d2b9be41114aa165a7",
"assets/assets/images/flags/tr.png": "a6e0f34494b61b3712cab1302b0a8df6",
"assets/assets/images/activity_flow/line_indicator_bottom.png": "af8c498e8c52740ff4d80dfd05578b55",
"assets/assets/images/activity_flow/line_indicator_top.png": "0a68354ac84a21b9335c5eab0c2313dc",
"assets/assets/images/logo.png": "14155d29dfef9e7702d0ec108d2f1475",
"assets/assets/images/sponsors/oyak.png": "799ae6463d5f544cc0d41103918dafd0",
"assets/assets/images/sponsors/webtekno.png": "60f9f74f9749dffbdc685154c43db1fd",
"assets/assets/images/sponsors/ceng_turkey.png": "a09da069181598685a5b153330696357",
"assets/assets/images/sponsors/yazilim_karavani.png": "48c549211eafeb07ca2bc6d32f204e34",
"assets/assets/images/sponsors/gdg_turkey.png": "4df319b3b240377570eb027e38107479",
"assets/assets/images/sponsors/dop.png": "8d69ba8f642f4686c752f45d1c0a38cf",
"assets/assets/images/sponsors/fluttertr.png": "6eebd6174c48e1648ec9e4f73070ee4f",
"assets/assets/images/sponsors/mdp.png": "53dfce093a81a35a155e01ace35b8c36",
"assets/assets/images/sponsors/parasut.png": "e75616b5aa0b6fb94a814f1186b41d99",
"assets/assets/images/speaker_placeholder.png": "44b7a2309b2a1553e145363a6e29a2c5",
"assets/assets/videos/countdown_bg.mp4": "6be1859926487e1bc7b101c093df5490",
"assets/NOTICES": "39658fd189d6d33898b4bd4accc660b0",
"icons/Icon-192.png": "f734be520ccdb09c10e2bbc6ec0b191b",
"icons/Icon-512.png": "939bbe74c06923f54a9c48805e72c498",
"manifest.json": "21ec26c3d3fde1fd00fb3b188a7bc64d",
"version.json": "a5587dbc7ccf3e4c887eec5941318b8f",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
