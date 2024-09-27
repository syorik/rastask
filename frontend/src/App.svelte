<script lang="ts">
  function handleClick(): void {
    console.log("Button clicked!");
  }
</script>

<main>
  <button on:click={handleClick}>Click me</button>
</main>

<style>
  button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
  }

  button:hover {
    background-color: #45a049;
  }
</style>
