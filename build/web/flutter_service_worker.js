'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "7c2f01b0c5e2ad5533c4a2a4dcf096bb",
"assets/AssetManifest.json": "27bc924db601aa05d238a225e47da390",
"assets/assets/AI_1.jpg": "7dccea65d7bac9e1def8811c8b366a0c",
"assets/assets/arvore_free.png": "973cafdac6d739f1c161ca7f4976d9e1",
"assets/assets/assinatura_keiji.png": "0272b78d4d33f9614a1245001302988e",
"assets/assets/assinatura_resia.png": "482f4a57d62bc64441906c0ed38a8610",
"assets/assets/audios/aguacorrente-edited_v2.mp3": "43b19d83ad60fd4bce057690783df54b",
"assets/assets/audios/chuva.mp3": "44fd53eb44e2778bf261aa15f0cc5203",
"assets/assets/audios/chuva_edited.mp3": "9605f524e60c150203a86342904098a7",
"assets/assets/audios/chuva_edited.wav": "78f0311224acfa9b58a512cbfca736b2",
"assets/assets/audios/dez_palavras.mp3": "d51b10ccee7f39916ea702ac971302e2",
"assets/assets/audios/quatro_palavras.mp3": "05a50eb6b5aa4d70f4451cb611a73c74",
"assets/assets/cachorro_free.png": "8826a756789f9f0c517bcf43aeddebbb",
"assets/assets/car.png": "847b361f92c25588ae17d3723af06545",
"assets/assets/casa_free.png": "175b8583d621db7b71cfe0a8bd6ff20b",
"assets/assets/cat_free.png": "b653aac5910ad515b14db8112577ab99",
"assets/assets/circo.png": "4b0209a565df58631d61b526ca9d7b6e",
"assets/assets/coracao_free.png": "e231871febb7f45a6f572b979e8d344d",
"assets/assets/CORREDOR.png": "bb4e2956c777eb18cfdb5445387587e2",
"assets/assets/Ebbinghaus.png": "a56a70f63bc330b35fc15cb926b3154a",
"assets/assets/emoji_confiante.png": "ecfda750ebbb8c535e9caa3eba660ceb",
"assets/assets/emoji_entediado.png": "1bb73aa62db88ea279deff6036111814",
"assets/assets/emoji_forte.png": "f0c222885f58b91007b3c56ef4c249f5",
"assets/assets/emoji_indeciso.png": "4b8509db69135454b006110fa2599255",
"assets/assets/emoji_nojo.png": "8fcc469e7de9fd415bda077593af4b9e",
"assets/assets/emoji_otimista%2520.png": "6ceb981591bd2a924423c969b4b57b25",
"assets/assets/emoji_panico.png": "203272c2b51a44b2d1fb0e1647350f28",
"assets/assets/emoji_pessimista.png": "f572cd5536e8cbd03d907e83da751930",
"assets/assets/emoji_poderoso%2520.png": "adf3d14eb47c23d3fb3f9c58c3557a1c",
"assets/assets/emoji_reflexivo.png": "ed5f59372f3a77b7df04aae549b0ca29",
"assets/assets/emoji_sempre_atrasado.png": "50fcf7a455fba4a95e233713894e0bb6",
"assets/assets/emoji_triste.png": "ca9c68917638782a4e1f4cd7df46a316",
"assets/assets/five_errors1.jpg": "4b42e6a62991160a2993f9fb0f2e30da",
"assets/assets/five_errors2.jpg": "df22e49a2ba8d3e09b877092e2265035",
"assets/assets/intel_1.png": "8347e50075486ae76575a50a61cbf35e",
"assets/assets/intel_1a.png": "eec20acd253e7d808d53fb604675570b",
"assets/assets/intel_1b.png": "07da4f006935ab2877ceb2abf31e80ac",
"assets/assets/intel_1c.png": "d34d49598607c6b1e5ec461b7e9235ba",
"assets/assets/intel_1d.png": "8c82ec8030379000863f227d62ceeb8c",
"assets/assets/intel_1e.png": "c569a1cadffc7437c9065600970a6d8e",
"assets/assets/intel_1f.png": "0439a6cb3283e488f17c230835cdbc40",
"assets/assets/intel_2.png": "373960231eb9828fc17a4d915a796d47",
"assets/assets/intel_2a.png": "23d971155109b1e1ef6898dcaf40612b",
"assets/assets/intel_2b.png": "949a0e18ae0cf5b394304e943f4fc479",
"assets/assets/intel_2c.png": "d339e9198607cc7048faac804a829d40",
"assets/assets/intel_2d.png": "4446653a6f3c7c3029613409738abe09",
"assets/assets/intel_2e.png": "18473d46d08fb96edb689cc988dfbcc0",
"assets/assets/intel_2f.png": "daf916fc472b4d9f1f118492d1974657",
"assets/assets/intel_4.png": "515ec4d771ff4e812a76086b800dee0b",
"assets/assets/intel_4a.png": "e4e48a9e4d92bddb66be5c68ee1a57d6",
"assets/assets/intel_4b.png": "435895f0c23df9c52c16ae8c1ee64319",
"assets/assets/intel_4c.png": "1894bf318c0710ec9166a31ca5854680",
"assets/assets/intel_4d.png": "ab91418ea752ee4edc245e30761a0747",
"assets/assets/intel_4e.png": "dcf627c9343773d809c38d2ce397ee00",
"assets/assets/intel_4f.png": "f9e0bfac044feafc0c87f7d1736f48ef",
"assets/assets/leao_free.png": "5476e2c70a9aae46a26e30acc6a73f89",
"assets/assets/mascara.png": "d9ae5fcb0811fe9b6d35c06eb568c4f8",
"assets/assets/motorcycle_free.png": "bf5fced12e35a579bc99a0e1b5c39df7",
"assets/assets/moto_free.png": "fc9328d4bb6b19403d0e56b386f705dc",
"assets/assets/NUMERO8.png": "edfde848bb9160e4092eafdc2b07344e",
"assets/assets/olho1.png": "d0ab8def16275d0ea149597aa42d94c4",
"assets/assets/olho10.png": "6d84d934477711275006b5e46ea1485d",
"assets/assets/olho11.png": "a297d521b25f18b460e3315bca49035e",
"assets/assets/olho12.png": "c8b09b4d1ad50e757ef04ebe3ea32d48",
"assets/assets/olho13.png": "316e1ab1495b891c20570b5cde84bb52",
"assets/assets/olho14.png": "f0d167f4e42bae2143aa9d9e5d83ed49",
"assets/assets/olho2.png": "1d88c412e1bad164457ec87d59c5a8a4",
"assets/assets/olho3.png": "f4b7a964d4d236ca4b6700e0ec78423a",
"assets/assets/olho4.png": "8a7fce9096c7d154190d5fb11fe597e4",
"assets/assets/olho5.png": "83afea344fff6546c76bf9fc2c8f8467",
"assets/assets/olho6.png": "6cdcef5cd4634c74e77b1b7f11319f8d",
"assets/assets/olho7.png": "855b57259078e37a9ea262019ee5f9ff",
"assets/assets/olho8.png": "89c15f4d2ecd21c6879743b584b209ea",
"assets/assets/olho9.png": "4ec0fb0fa569eab3b5f73c0ddb6831d4",
"assets/assets/PAPAI%2520NOEL.png": "bf75752649c486a47a26bf0d9e9f5ce4",
"assets/assets/passaro_free.png": "87a616e1c6ee75256e37cd63a84fcdc6",
"assets/assets/ponte_free.jpg": "fae5ef3ef6b587865c6ce1b509a833ee",
"assets/assets/pontos.jpg": "1b0b6a5bff658e892654edddc5580ac5",
"assets/assets/questao32.png": "ade537329d2c588959a8c0d4183688df",
"assets/assets/questao45bombons.png": "08f20c58956eeacca2df4839261b921e",
"assets/assets/questao45cachorro.png": "ee5a89b6fdfcf017fbe0ef89f7cd8596",
"assets/assets/questao45cafe.png": "c11a886c85c5fea63b7fa51a0f8a5b73",
"assets/assets/questao45carro.png": "e930a955bd79c3a6d5cc57ec855f5c7a",
"assets/assets/questao45casa.png": "6fd85ac744afb300be501703a6ec5354",
"assets/assets/questao45cerveja.png": "25cd44dacf6d1a8111900c65bd42fd72",
"assets/assets/questao45cocacola.png": "c019efb83eda6b0bf2b4d890fa2173d6",
"assets/assets/questao45coquetel.png": "6b01f2ef51d26fcb65db5ebaff6649fd",
"assets/assets/questao45gato.png": "eaccd9fe9102c2b35d739f261e5754dc",
"assets/assets/questao45humburgue.png": "f20dc45fa8281019d30bfba3b038490f",
"assets/assets/questao45leao.png": "6f6baf8553446e530511793b3c9f66df",
"assets/assets/questao45passaro.png": "83ea3354b1ad730efbf6ac03ba1ea234",
"assets/assets/questao48.png": "2303efc48e76ba6492ed62c36230113a",
"assets/assets/reciclagem.png": "10ed929c48522a8e7081c063d983e716",
"assets/assets/rosa_free.png": "15c793fafa3bbea8d7368bb286430ce9",
"assets/assets/seisimagens.png": "7b0e7f7b5d759c57cf56bc5d29b0bee1",
"assets/assets/teste_logica_3.png": "ba26664255449018e4883fb5260d9dba",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "b2e3d1cd1fe5e04cb825291d04d40da9",
"assets/NOTICES": "78bce2e59dd378a80f9ce3ce05293812",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e882bf46127e69651811646e35ef5a7b",
"/": "e882bf46127e69651811646e35ef5a7b",
"main.dart.js": "5ba1be12497bc945be5ddfed631f4d13",
"manifest.json": "b10d1f42962c72025e561082ad9ac588",
"version.json": "dd75e386ed00e07c7ef4778e055cdb20"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
