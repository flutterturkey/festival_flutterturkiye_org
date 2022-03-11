'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/images/sponsors/fluttertr.png": "6eebd6174c48e1648ec9e4f73070ee4f",
"assets/assets/images/speakers/mirsaid_ismailov.jpg": "367989653dd02807434872882052d1ab",
"assets/assets/images/speakers/salih_can_binboga.jpg": "2aa24121aa1327a59564a564cc56fb5f",
"assets/assets/images/speakers/dashatar.png": "ac9d3e804bfc692c064b9647e3ebff5b",
"assets/assets/images/speakers/cagatay_ulusoy.jpg": "170f67f8e58512cc04a1bf41fa71790a",
"assets/assets/images/speakers/bartosz_kraszewski.jpg": "b0acde78866dd94f8ccb670e87d6b83b",
"assets/assets/images/speakers/elif_bilge_parlak.jpg": "55425509fb6bbdd2c21515f1b68a4991",
"assets/assets/images/speakers/adem_furkan_ozcan.jpg": "806f1e39648c549fa7114f63012cdb8b",
"assets/assets/images/speakers/berkay_cayli.jpg": "16feca98bf1b0e9549314095759c670e",
"assets/assets/images/speakers/ganesh_s_p.jpg": "6b2b4137942682444e315d190d93b073",
"assets/assets/images/speakers/muhammed_salih_guler.jpg": "52e96e3ae6217ab5dd1a922c9dc3a646",
"assets/assets/images/speakers/majid_hajian.jpg": "eaf01b716094fb212e09483d97c22b4d",
"assets/assets/images/speakers/kadriye_macit.jpg": "12683dc9f79c07da4c7012a50bbb9ef8",
"assets/assets/images/speakers/levent_kantaroglu.jpg": "b8599d0a908ead79b6251b874da380d2",
"assets/assets/images/speakers/osman_celik.jpg": "96f3902f7c8289e09e415ff31358e0f3",
"assets/assets/images/speakers/rihanna_kedir.jpeg": "236b7764d1d422570798339737ede358",
"assets/assets/images/speakers/murat_tekin.jpg": "7217d5e1054c184f1c393db2288a0df9",
"assets/assets/images/speakers/muhammet_omer.jpg": "2c03c8dfc134f6395c3dc825498b686b",
"assets/assets/images/speakers/berat_goktug_ozdemir.png": "4821222e9276a4d728abf457aacf8a05",
"assets/assets/images/speakers/thomas_burkhart.jpeg": "271e151cc997a09e58ab116df3e4f7ac",
"assets/assets/images/speakers/team_kraken.jpg": "be0f99e4f98f3eefa45e7c6366cd9917",
"assets/assets/images/speakers/nawal_alhamwi.jpeg": "32113743292340e9c072d85f8ab68c5b",
"assets/assets/images/speakers/mehmet_ali_bayram.jpg": "269676bd5209099bb5720fbb046c1a80",
"assets/assets/images/speakers/gazihan_alankus.jpg": "2d7efedc20b338c6f9bec88d8fd69f1d",
"assets/assets/images/speakers/gurkan_fikret_gunak.jpg": "8885dd6a6a7bb77b5293c2ba03f8aa77",
"assets/assets/images/logo.png": "14155d29dfef9e7702d0ec108d2f1475",
"assets/assets/images/flags/tr.png": "a6e0f34494b61b3712cab1302b0a8df6",
"assets/assets/images/flags/en.png": "0fcced5950ccb4d2b9be41114aa165a7",
"assets/assets/images/footer_bg.jpg": "16489d16bd8133b7d63b275dd26ecd1e",
"assets/assets/images/activity_flow/line_indicator_top.png": "0a68354ac84a21b9335c5eab0c2313dc",
"assets/assets/images/activity_flow/line_indicator_bottom.png": "af8c498e8c52740ff4d80dfd05578b55",
"assets/assets/images/speaker_placeholder.png": "44b7a2309b2a1553e145363a6e29a2c5",
"assets/assets/videos/countdown_bg.mp4": "6be1859926487e1bc7b101c093df5490",
"assets/FontManifest.json": "e5f189376d751fa6cf98e1dd848daced",
"assets/packages/material_design_icons_flutter/lib/fonts/materialdesignicons-webfont.ttf": "b62641afc9ab487008e996a5c5865e56",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/AssetManifest.json": "c59de1e4a19b76f633b0c085fff4c646",
"assets/NOTICES": "39658fd189d6d33898b4bd4accc660b0",
"assets/fonts/Manrope-ExtraBold.ttf": "9a4548b7ec8765f156ad01e9999b24ef",
"assets/fonts/Montserrat-Regular.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/fonts/Manrope-Light.ttf": "8a28ab731b16cc9423d5d0a8555c9228",
"assets/fonts/Manrope-Bold.ttf": "98ea53ab8548a5f9e984dd93a94e07c4",
"assets/fonts/Manrope-Regular.ttf": "a9faa3e7843c86bd8693aa685101332b",
"assets/fonts/Manrope-Medium.ttf": "9846b3db6e4eec04b6f956169f65b3aa",
"assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/fonts/Manrope-ExtraLight.ttf": "fc31f26b4b217f3af2aa6c103a3c45d8",
"assets/fonts/Manrope-SemiBold.ttf": "e03737a9e201df701880f20f727b90dc",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"index.html": "d01419d8514f8560359c71b26bdfb8e6",
"/": "d01419d8514f8560359c71b26bdfb8e6",
"version.json": "e9c992da5fbf95ff89dfa34521a8e9d8",
"icons/Icon-512.png": "939bbe74c06923f54a9c48805e72c498",
"icons/Icon-192.png": "f734be520ccdb09c10e2bbc6ec0b191b",
"main.dart.js": "046f8b73f65870ff193e570b01c948db",
"favicon.png": "984542880c9a626c99c8984baa3f5c29",
"manifest.json": "21ec26c3d3fde1fd00fb3b188a7bc64d",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba"
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
