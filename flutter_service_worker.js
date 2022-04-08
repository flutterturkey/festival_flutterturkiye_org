'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "1fabb08914fe6872c81e9566f618eed4",
"index.html": "d01419d8514f8560359c71b26bdfb8e6",
"/": "d01419d8514f8560359c71b26bdfb8e6",
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
"assets/AssetManifest.json": "86c910dcf1c2be5ef17133bcd20cce9b",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "b62641afc9ab487008e996a5c5865e56",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/FontManifest.json": "e5f189376d751fa6cf98e1dd848daced",
"assets/assets/images/speakers/team_kraken.jpg": "be0f99e4f98f3eefa45e7c6366cd9917",
"assets/assets/images/speakers/abdullah_oguz.png": "2e5d6ac86958a4e462b98476042fd86b",
"assets/assets/images/speakers/mehmet_ali_bayram.jpeg": "4c973d7527a65b4ec2bec0d09dd32163",
"assets/assets/images/speakers/murat_tekin.jpeg": "68c513e92dbb89fa502ddb1cd0473396",
"assets/assets/images/speakers/nilay_yener.jpeg": "2d1634de2e890210bfa01d6d545459d3",
"assets/assets/images/speakers/ashita_prasad.jpeg": "e3c4d1fa55712a0ec11517df70066c76",
"assets/assets/images/speakers/berat_goktug_ozdemir.png": "4821222e9276a4d728abf457aacf8a05",
"assets/assets/images/speakers/roaa_khaddam.png": "f1f47ff01917864ce60573b6eaad6d67",
"assets/assets/images/speakers/mangirdas_kazlauskas.jpeg": "7ad5dd1da0ea5ab0101bdd766d058ec8",
"assets/assets/images/speakers/fatih_demir.jpeg": "cca01545baaacd0549ee1afa17bd168b",
"assets/assets/images/speakers/samet_cilingir.jpeg": "50e7878669d732b20dcfc8beda5603e3",
"assets/assets/images/speakers/yunus_emre_bakir.jpeg": "c6b4f89a8043af83cb872c112dd4cacc",
"assets/assets/images/speakers/gurkan_fikret_gunak.jpeg": "35a8cce69655c4ccc68400d6e9c272db",
"assets/assets/images/speakers/gazihan_alankus.jpeg": "7fffc4603e954c7dd955538715b00e93",
"assets/assets/images/speakers/gizem_malcok.jpeg": "a897fd36a08e1b308f7e90db40616d2b",
"assets/assets/images/speakers/levent_kantaroglu.png": "b89fbf791c18de6e8020a0489d27bfc0",
"assets/assets/images/speakers/volkan_agaoglu.jpg": "e40d97b29da979f51ca3c45bd7ef9b36",
"assets/assets/images/speakers/ismail_gorkem_gunes.jpeg": "a0b124fc3c3d4a9e56aca130556e95c7",
"assets/assets/images/speakers/mirsaid_ismailov.jpeg": "87343f4751ffc49eb047c027a7ea6961",
"assets/assets/images/speakers/emir_bostanci.jpeg": "8ad957431b955ec72cdbcf831f0e74fb",
"assets/assets/images/speakers/mikail_kose.jpeg": "9332587d7169674e4e47298e1f1d7050",
"assets/assets/images/speakers/dashatar.png": "ac9d3e804bfc692c064b9647e3ebff5b",
"assets/assets/images/speakers/kadriye_macit.jpg": "12683dc9f79c07da4c7012a50bbb9ef8",
"assets/assets/images/footer_bg.jpg": "16489d16bd8133b7d63b275dd26ecd1e",
"assets/assets/images/flags/en.png": "0fcced5950ccb4d2b9be41114aa165a7",
"assets/assets/images/flags/tr.png": "a6e0f34494b61b3712cab1302b0a8df6",
"assets/assets/images/activity_flow/line_indicator_bottom.png": "af8c498e8c52740ff4d80dfd05578b55",
"assets/assets/images/activity_flow/line_indicator_top.png": "0a68354ac84a21b9335c5eab0c2313dc",
"assets/assets/images/logo.png": "14155d29dfef9e7702d0ec108d2f1475",
"assets/assets/images/sponsors/oyak.png": "799ae6463d5f544cc0d41103918dafd0",
"assets/assets/images/sponsors/gdg_turkey.png": "4df319b3b240377570eb027e38107479",
"assets/assets/images/sponsors/dop.png": "8d69ba8f642f4686c752f45d1c0a38cf",
"assets/assets/images/sponsors/fluttertr.png": "6eebd6174c48e1648ec9e4f73070ee4f",
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
