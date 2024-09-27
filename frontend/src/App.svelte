<script lang="ts">
  import { fade, fly } from 'svelte/transition';
  let currentPage = 'Dashboard';

  function setCurrentPage(page: string): void {
    currentPage = page;
  }
</script>

<main class="flex h-screen bg-gradient-to-br from-gray-900 to-black">
  <!-- Left side panel with navigation -->
  <nav class="w-72 bg-gray-800 bg-opacity-50 backdrop-filter backdrop-blur-lg">
    <ul class="space-y-4 py-8">
      {#each ['Dashboard', "What's next", 'Tasks', 'Notes', 'Passwords'] as page}
        <li>
          <button
            on:click={() => setCurrentPage(page)}
            class={`w-full text-left px-8 py-4 rounded-l-full transition-all duration-300 text-xl ${
              currentPage === page 
                ? 'bg-indigo-600 text-white font-semibold shadow-lg' 
                : 'text-gray-300 hover:bg-gray-700 hover:bg-opacity-50'
            }`}
          >
            {page}
          </button>
        </li>
      {/each}
    </ul>
  </nav>

  <!-- Right side content panel -->
  <div class="flex-1 p-12 overflow-y-auto">
    <div class="max-w-4xl mx-auto">
      <h2 class="text-5xl font-bold text-white mb-10" in:fly={{ y: -20, duration: 300 }}>{currentPage}</h2>
      <div class="bg-gray-800 bg-opacity-50 backdrop-filter backdrop-blur-lg rounded-3xl p-10 shadow-2xl" in:fly={{ y: 20, duration: 300 }}>
        <p class="text-gray-200 text-xl">Content for {currentPage} goes here.</p>
      </div>
    </div>
  </div>
</main>

<style>
  :global(body) {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
    @apply bg-gray-900;
  }

  :global(*) {
    @apply touch-manipulation;
  }

  button {
    @apply focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-opacity-50;
  }
</style>
