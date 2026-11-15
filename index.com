<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PlayStation Store Indonesia - Official Game Catalog</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #001122;
            color: #ffffff;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .active-nav {
            border-bottom: 2px solid #0070D1;
            color: #0070D1;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col justify-between">

    <!-- Header / Navbar -->
    <header class="bg-[#003087] px-6 py-4 flex justify-between items-center shadow-lg sticky top-0 z-50">
        <div class="flex items-center space-x-3">
            <span class="text-2xl font-black tracking-wider text-white cursor-pointer" onclick="switchTab('home')">PLAYSTATION STORE</span>
        </div>
        <nav class="hidden md:flex space-x-6 text-sm font-semibold">
            <button type="button" onclick="switchTab('home')" id="nav-home" class="hover:text-cyan-400 transition pb-1 active-nav">Home</button>
            <button type="button" onclick="switchTab('products')" id="nav-products" class="hover:text-cyan-400 transition pb-1">Produk</button>
            <button type="button" onclick="switchTab('collections')" id="nav-collections" class="hover:text-cyan-400 transition pb-1">Koleksi</button>
            <button type="button" onclick="switchTab('profile')" id="nav-profile" class="hover:text-cyan-400 transition pb-1">Profil</button>
        </nav>
        <div class="flex items-center space-x-3">
            <span class="text-xs bg-[#0070D1] px-3 py-1.5 rounded-full font-bold">IDR (Rp)</span>
        </div>
    </header>

    <!-- Main Content Container -->
    <main class="max-w-7xl mx-auto px-4 py-8 flex-grow w-full">

        <!-- 1. HALAMAN HOME -->
        <section id="tab-home" class="page-section">
            <div class="relative rounded-2xl overflow-hidden bg-gradient-to-r from-blue-900 via-indigo-900 to-slate-900 p-8 md:p-12 mb-8 shadow-2xl border border-blue-800/40">
                <div class="max-w-2xl">
                    <span class="bg-[#0070D1] text-xs uppercase px-3 py-1 rounded-full font-bold tracking-wide text-white">Selamat Datang, Gamers! 🎮</span>
                    <h1 class="text-3xl md:text-5xl font-extrabold mt-4 mb-4 leading-tight">Pusat Game, Diskon, & Pre-Order PlayStation Terbaik</h1>
                    <p class="text-gray-300 mb-6 text-sm md:text-base leading-relaxed">
                        Halo, <strong>Gamer Indonesia!</strong> Selamat datang di platform katalog interaktif PlayStation Store buatan <strong>Raul</strong>. Temukan petualangan epik, game AAA eksklusif generasi terbaru untuk PS5 dan PS4, serta nikmati penawaran harga terbaik minggu ini.
                    </p>
                    <div class="flex flex-wrap gap-4">
                        <button type="button" onclick="switchTab('products')" class="bg-[#0070D1] hover:bg-blue-600 text-white font-bold px-6 py-3 rounded-full transition shadow-lg">
                            Mulai Jelajahi Katalog
                        </button>
                        <button type="button" onclick="switchTab('collections')" class="bg-[#0a2342] hover:bg-blue-900 text-cyan-300 border border-cyan-500/40 font-bold px-6 py-3 rounded-full transition shadow-lg">
                            Lihat Promo & Diskon
                        </button>
                    </div>
                </div>
            </div>

            <!-- Keterangan Website -->
            <div class="bg-[#0a2342] border-l-4 border-cyan-400 p-5 rounded-xl mb-10 shadow-md">
                <h3 class="font-bold text-lg text-cyan-300 mb-1">ℹ️ Tentang Website Ini</h3>
                <p class="text-sm text-gray-300 leading-relaxed">
                    Website katalog interaktif bertema PlayStation Store Indonesia yang dikembangkan oleh <strong>Raul</strong>. Menggunakan poster game asli dan tautan langsung ke halaman store resmi untuk memudahkan Anda mengecek detail game impian.
                </p>
            </div>
        </section>

        <!-- 2. HALAMAN PRODUK -->
        <section id="tab-products" class="page-section hidden">
            <div class="flex flex-col md:flex-row justify-between items-start md:items-center mb-6 gap-4">
                <h2 class="text-2xl font-bold border-l-4 border-[#0070D1] pl-3">Semua Produk Game</h2>
                
                <!-- Kotak Pencarian & Filter Harga -->
                <div class="flex flex-col sm:flex-row gap-3 w-full md:w-auto">
                    <input type="text" id="searchInput" onkeyup="filterProducts()" placeholder="Cari nama game..." 
                        class="bg-[#0a2342] border border-blue-900 px-4 py-2 rounded-lg text-sm text-white focus:outline-none focus:border-cyan-400 w-full sm:w-64">
                    
                    <select id="priceFilter" onchange="filterProducts()" 
                        class="bg-[#0a2342] border border-blue-900 px-4 py-2 rounded-lg text-sm text-white focus:outline-none focus:border-cyan-400">
                        <option value="all">Semua Harga</option>
                        <option value="under-700">Di bawah Rp 700.000</option>
                        <option value="above-700">Di atas Rp 700.000</option>
                    </select>
                </div>
            </div>
            
            <!-- Daftar Kartu Produk dengan Poster Game Asli -->
            <div id="productContainer" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                
                <!-- Produk 1: GTA VI -->
                <div class="product-card bg-[#0a2342] rounded-xl overflow-hidden shadow-lg hover:scale-105 transition duration-300 flex flex-col justify-between group" data-title="grand theft auto vi gta 6" data-price="1029000">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank">
                        <div class="h-48 bg-gray-900 overflow-hidden flex items-center justify-center relative">
                            <img src="https://media.rawg.io/media/games/688/688961c02052efc96257edd38883737b.jpg" alt="GTA VI" class="w-full h-full object-cover group-hover:opacity-90 transition">
                            <span class="absolute bottom-2 left-2 bg-black/70 text-xs px-2 py-0.5 rounded text-cyan-300 font-bold">PS5</span>
                        </div>
                        <div class="p-4">
                            <span class="text-xs text-blue-400 font-semibold">PS5</span>
                            <h3 class="font-bold text-lg mt-1 group-hover:text-cyan-300 transition">Grand Theft Auto VI</h3>
                            <p class="text-xs text-gray-400 mt-1">Standard Edition / Pre-Order</p>
                            <div class="mt-3 pt-3 border-t border-blue-900/60 text-xs text-gray-400">
                                <span class="block text-gray-500 font-medium">Developer / Studio:</span>
                                <span class="text-gray-300 font-semibold">Rockstar Games</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 pt-0 flex justify-between items-center">
                        <span class="font-bold text-lg">Rp 1.029.000</span>
                        <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] text-xs px-3 py-1.5 rounded font-semibold hover:bg-blue-600">Beli</a>
                    </div>
                </div>

                <!-- Produk 2: EA Sports FC 25 -->
                <div class="product-card bg-[#0a2342] rounded-xl overflow-hidden shadow-lg hover:scale-105 transition duration-300 flex flex-col justify-between group" data-title="ea sports fc 25 fifa" data-price="759000">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank">
                        <div class="h-48 bg-gray-900 overflow-hidden flex items-center justify-center relative">
                            <img src="https://images.unsplash.com/photo-1579952363873-27f3bade9f55?w=500&auto=format&fit=crop&q=60" alt="FC 25" class="w-full h-full object-cover group-hover:opacity-90 transition">
                            <span class="absolute bottom-2 left-2 bg-black/70 text-xs px-2 py-0.5 rounded text-cyan-300 font-bold">PS5 / PS4</span>
                        </div>
                        <div class="p-4">
                            <span class="text-xs text-blue-400 font-semibold">PS5 / PS4</span>
                            <h3 class="font-bold text-lg mt-1 group-hover:text-cyan-300 transition">EA Sports FC 25</h3>
                            <p class="text-xs text-gray-400 mt-1">Standard Edition</p>
                            <div class="mt-3 pt-3 border-t border-blue-900/60 text-xs text-gray-400">
                                <span class="block text-gray-500 font-medium">Developer / Studio:</span>
                                <span class="text-gray-300 font-semibold">EA Vancouver</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 pt-0 flex justify-between items-center">
                        <span class="font-bold text-lg">Rp 759.000</span>
                        <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] text-xs px-3 py-1.5 rounded font-semibold hover:bg-blue-600">Beli</a>
                    </div>
                </div>

                <!-- Produk 3: Spider-Man 2 -->
                <div class="product-card bg-[#0a2342] rounded-xl overflow-hidden shadow-lg hover:scale-105 transition duration-300 flex flex-col justify-between group" data-title="marvel's spider-man 2 spiderman" data-price="1029000">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank">
                        <div class="h-48 bg-gray-900 overflow-hidden flex items-center justify-center relative">
                            <img src="https://media.rawg.io/media/games/b2a/b2a1a09d38e55e0a0d0cb74414f82be3.jpg" alt="Spider-Man 2" class="w-full h-full object-cover group-hover:opacity-90 transition">
                            <span class="absolute bottom-2 left-2 bg-black/70 text-xs px-2 py-0.5 rounded text-cyan-300 font-bold">PS5</span>
                        </div>
                        <div class="p-4">
                            <span class="text-xs text-blue-400 font-semibold">PS5</span>
                            <h3 class="font-bold text-lg mt-1 group-hover:text-cyan-300 transition">Marvel's Spider-Man 2</h3>
                            <p class="text-xs text-gray-400 mt-1">Digital Deluxe Edition</p>
                            <div class="mt-3 pt-3 border-t border-blue-900/60 text-xs text-gray-400">
                                <span class="block text-gray-500 font-medium">Developer / Studio:</span>
                                <span class="text-gray-300 font-semibold">Insomniac Games</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 pt-0 flex justify-between items-center">
                        <span class="font-bold text-lg">Rp 1.029.000</span>
                        <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] text-xs px-3 py-1.5 rounded font-semibold hover:bg-blue-600">Beli</a>
                    </div>
                </div>

                <!-- Produk 4: Helldivers 2 -->
                <div class="product-card bg-[#0a2342] rounded-xl overflow-hidden shadow-lg hover:scale-105 transition duration-300 flex flex-col justify-between group" data-title="helldivers 2" data-price="559000">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank">
                        <div class="h-48 bg-gray-900 overflow-hidden flex items-center justify-center relative">
                            <img src="https://media.rawg.io/media/games/46d/46d98eacfadc90dd3f95b5b487f9d51e.jpg" alt="Helldivers 2" class="w-full h-full object-cover group-hover:opacity-90 transition">
                            <span class="absolute bottom-2 left-2 bg-black/70 text-xs px-2 py-0.5 rounded text-cyan-300 font-bold">PS5 / PS4</span>
                        </div>
                        <div class="p-4">
                            <span class="text-xs text-blue-400 font-semibold">PS5 / PS4</span>
                            <h3 class="font-bold text-lg mt-1 group-hover:text-cyan-300 transition">Helldivers 2</h3>
                            <p class="text-xs text-gray-400 mt-1">Super Citizen Edition</p>
                            <div class="mt-3 pt-3 border-t border-blue-900/60 text-xs text-gray-400">
                                <span class="block text-gray-500 font-medium">Developer / Studio:</span>
                                <span class="text-gray-300 font-semibold">Arrowhead Studios</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 pt-0 flex justify-between items-center">
                        <span class="font-bold text-lg">Rp 559.000</span>
                        <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] text-xs px-3 py-1.5 rounded font-semibold hover:bg-blue-600">Beli</a>
                    </div>
                </div>

                <!-- Produk 5: God of War Ragnarök -->
                <div class="product-card bg-[#0a2342] rounded-xl overflow-hidden shadow-lg hover:scale-105 transition duration-300 flex flex-col justify-between group" data-title="god of war ragnarok" data-price="879000">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank">
                        <div class="h-48 bg-gray-900 overflow-hidden flex items-center justify-center relative">
                            <img src="https://media.rawg.io/media/games/c47/c4796c4c49e7e06ad328e07aa8944cdd.jpg" alt="God of War Ragnarok" class="w-full h-full object-cover group-hover:opacity-90 transition">
                            <span class="absolute bottom-2 left-2 bg-black/70 text-xs px-2 py-0.5 rounded text-cyan-300 font-bold">PS5 / PS4</span>
                        </div>
                        <div class="p-4">
                            <span class="text-xs text-blue-400 font-semibold">PS5 / PS4</span>
                            <h3 class="font-bold text-lg mt-1 group-hover:text-cyan-300 transition">God of War Ragnarök</h3>
                            <p class="text-xs text-gray-400 mt-1">Standard Edition</p>
                            <div class="mt-3 pt-3 border-t border-blue-900/60 text-xs text-gray-400">
                                <span class="block text-gray-500 font-medium">Developer / Studio:</span>
                                <span class="text-gray-300 font-semibold">Santa Monica Studio</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 pt-0 flex justify-between items-center">
                        <span class="font-bold text-lg">Rp 879.000</span>
                        <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] text-xs px-3 py-1.5 rounded font-semibold hover:bg-blue-600">Beli</a>
                    </div>
                </div>

                <!-- Produk 6: Elden Ring -->
                <div class="product-card bg-[#0a2342] rounded-xl overflow-hidden shadow-lg hover:scale-105 transition duration-300 flex flex-col justify-between group" data-title="elden ring shadow of the erdtree" data-price="599000">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank">
                        <div class="h-48 bg-gray-900 overflow-hidden flex items-center justify-center relative">
                            <img src="https://media.rawg.io/media/games/5ec/5ecac5cb026ec26a17ef95034645242f.jpg" alt="Elden Ring" class="w-full h-full object-cover group-hover:opacity-90 transition">
                            <span class="absolute bottom-2 left-2 bg-black/70 text-xs px-2 py-0.5 rounded text-cyan-300 font-bold">PS5 / PS4</span>
                        </div>
                        <div class="p-4">
                            <span class="text-xs text-blue-400 font-semibold">PS5 / PS4</span>
                            <h3 class="font-bold text-lg mt-1 group-hover:text-cyan-300 transition">Elden Ring</h3>
                            <p class="text-xs text-gray-400 mt-1">Game of the Year Edition</p>
                            <div class="mt-3 pt-3 border-t border-blue-900/60 text-xs text-gray-400">
                                <span class="block text-gray-500 font-medium">Developer / Studio:</span>
                                <span class="text-gray-300 font-semibold">FromSoftware</span>
                            </div>
                        </div>
                    </a>
                    <div class="p-4 pt-0 flex justify-between items-center">
                        <span class="font-bold text-lg">Rp 599.000</span>
                        <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] text-xs px-3 py-1.5 rounded font-semibold hover:bg-blue-600">Beli</a>
                    </div>
                </div>

            </div>

            <div id="noResult" class="hidden text-center py-12 text-gray-400">
                <p class="text-lg">🎮 Game yang Anda cari tidak ditemukan.</p>
            </div>
        </section>

        <!-- 3. HALAMAN KOLEKSI -->
        <section id="tab-collections" class="page-section hidden">
            <h2 class="text-2xl font-bold mb-6 border-l-4 border-[#0070D1] pl-3">Koleksi Pilihan Store</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="bg-gradient-to-br from-purple-900 to-blue-900 rounded-xl p-6 shadow-xl flex flex-col justify-between">
                    <div>
                        <span class="text-xs bg-purple-600 px-2.5 py-1 rounded font-bold uppercase">Koleksi Spesial</span>
                        <h3 class="text-xl font-extrabold mt-3 mb-2">Eksklusif PlayStation</h3>
                        <p class="text-gray-300 text-sm mb-4">Nikmati mahakarya game AAA yang hanya bisa dimainkan di ekosistem PlayStation.</p>
                    </div>
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-white text-gray-900 text-center font-bold py-2 rounded-lg hover:bg-gray-200 transition">Lihat Koleksi</a>
                </div>

                <div class="bg-gradient-to-br from-blue-900 to-cyan-900 rounded-xl p-6 shadow-xl flex flex-col justify-between">
                    <div>
                        <span class="text-xs bg-cyan-600 px-2.5 py-1 rounded font-bold uppercase">Diskon & Penawaran</span>
                        <h3 class="text-xl font-extrabold mt-3 mb-2">Planet of the Deals</h3>
                        <p class="text-gray-300 text-sm mb-4">Temukan diskon besar-besaran untuk ratusan game pilihan setiap minggunya.</p>
                    </div>
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-white text-gray-900 text-center font-bold py-2 rounded-lg hover:bg-gray-200 transition">Lihat Diskon</a>
                </div>

                <div class="bg-gradient-to-br from-indigo-900 to-slate-900 rounded-xl p-6 shadow-xl flex flex-col justify-between">
                    <div>
                        <span class="text-xs bg-indigo-600 px-2.5 py-1 rounded font-bold uppercase">Langganan</span>
                        <h3 class="text-xl font-extrabold mt-3 mb-2">PlayStation Plus</h3>
                        <p class="text-gray-300 text-sm mb-4">Mainkan ratusan game gratis, multiplayer online, dan diskon eksklusif member.</p>
                    </div>
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-white text-gray-900 text-center font-bold py-2 rounded-lg hover:bg-gray-200 transition">Gabung PS Plus</a>
                </div>
            </div>
        </section>

        <!-- 4. HALAMAN PROFIL -->
        <section id="tab-profile" class="page-section hidden">
            <h2 class="text-2xl font-bold mb-6 border-l-4 border-[#0070D1] pl-3">Profil Pengguna</h2>
            <div class="bg-[#0a2342] rounded-xl p-6 md:p-8 shadow-xl max-w-2xl mx-auto">
                <div class="flex items-center space-x-4 mb-6 pb-6 border-b border-blue-900">
                    <div class="w-16 h-16 bg-blue-600 rounded-full flex items-center justify-center text-2xl font-bold">
                        R
                    </div>
                    <div>
                        <h3 class="text-xl font-bold">Raul (Developer)</h3>
                        <p class="text-xs text-gray-400">Online ID: <span class="text-cyan-400">Raul_PlayStation</span></p>
                        <span class="inline-block mt-2 bg-[#0070D1] text-xs px-2.5 py-0.5 rounded font-semibold">PS Plus Premium Member</span>
                    </div>
                </div>
                <div class="grid grid-cols-2 gap-4 mb-6">
                    <div class="bg-[#001122] p-4 rounded-lg">
                        <span class="text-xs text-gray-400">Wallet Balance</span>
                        <p class="text-lg font-bold text-green-400">Rp 500.000</p>
                    </div>
                    <div class="bg-[#001122] p-4 rounded-lg">
                        <span class="text-xs text-gray-400">Trophy Level</span>
                        <p class="text-lg font-bold text-yellow-400">⭐ Level 300</p>
                    </div>
                </div>
                <div class="flex justify-end space-x-3">
                    <a href="https://store.playstation.com/en-id/pages/latest" target="_blank" class="bg-[#0070D1] hover:bg-blue-600 px-4 py-2 rounded-lg text-sm font-semibold transition">Buka Akun Store Resmi</a>
                </div>
            </div>
        </section>

    </main>

    <!-- Footer dengan Nama Raul -->
    <footer class="bg-[#000a14] py-6 text-center text-xs text-gray-400 mt-12 border-t border-blue-900/40">
        <p>&copy; 2026 PlayStation Store Replica. Developed with ❤️ by <span class="text-cyan-400 font-bold">Raul</span>. All rights reserved.</p>
    </footer>

    <!-- JavaScript Navigasi & Filter Produk -->
    <script>
        function switchTab(tabId) {
            const sections = document.querySelectorAll('.page-section');
            sections.forEach(sec => sec.classList.add('hidden'));

            const targetSection = document.getElementById('tab-' + tabId);
            if (targetSection) targetSection.classList.remove('hidden');

            const navButtons = document.querySelectorAll('header nav button');
            navButtons.forEach(btn => btn.classList.remove('active-nav'));

            const targetNav = document.getElementById('nav-' + tabId);
            if (targetNav) targetNav.classList.add('active-nav');
            
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        function filterProducts() {
            const searchInput = document.getElementById('searchInput').value.toLowerCase();
            const priceFilter = document.getElementById('priceFilter').value;
            const cards = document.querySelectorAll('.product-card');
            const noResult = document.getElementById('noResult');
            
            let visibleCount = 0;

            cards.forEach(card => {
                const title = card.getAttribute('data-title');
                const price = parseInt(card.getAttribute('data-price'));

                const matchesSearch = title.includes(searchInput);

                let matchesPrice = true;
                if (priceFilter === 'under-700') {
                    matchesPrice = price <= 700000;
                } else if (priceFilter === 'above-700') {
                    matchesPrice = price > 700000;
                }

                if (matchesSearch && matchesPrice) {
                    card.style.display = 'flex';
                    visibleCount++;
                } else {
                    card.style.display = 'none';
                }
            });

            if (visibleCount === 0) {
                noResult.classList.remove('hidden');
            } else {
                noResult.classList.add('hidden');
            }
        }
    </script>
</body>
</html>
