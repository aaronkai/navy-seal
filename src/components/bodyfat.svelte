<script>
  let lbs;
  let neck;
  let waist;
  let height;
  let bodyfatPercentage;
  let sex = "Male";
  let hips;

  function processForm(lbs, neck, waist, height, hips) {
    if (sex === "Male") {
      bodyfatPercentage =
        Math.round(
          (86.01 * Math.log10(waist - neck) -
            70.041 * Math.log10(height) +
            36.76) *
            100
        ) / 100;
    } else {
      bodyfatPercentage =
        Math.round(
          (163.205 * Math.log10(waist + hips - neck) -
            97.684 * Math.log10(height) -
            78.387) *
            100
        ) / 100;
    }
    return bodyfatPercentage;
  }

  function handleReset() {
    bodyfatPercentage = undefined;
  }

  // 	formula for men
  //  86.010 x log10 (waist - neck) - 70.041 x log10 (height) + 36.76
  //  formula for women
  //  163.205 x log10 (waist + hip - neck) - 97.684 x log10 (height) - 78.387
</script>

<main class="grid gap-8 justify-center items-center">
  {#if !bodyfatPercentage}
    <form
      class=" border-slate-900 grid grid-cols-2 gap-4 max-w-md justify-center mt-8"
      on:submit|preventDefault={processForm(lbs, neck, waist, height, hips)}
    >
      <h3 class="col-span-2 text-slate-900 text-3xl text-center font-bungee">
        Your Biometrics:
      </h3>

      <label class="font-bungee text-lg text-slate-900" for="male">
        <input
          type="radio"
          id="male"
          name="sex"
          bind:group={sex}
          value="Male"
        />
        Male
      </label>
      <label class="font-bungee text-lg text-slate-900" for="female">
        <input
          type="radio"
          id="female"
          name="sex"
          bind:group={sex}
          value="Female"
        />
        Female
      </label>
      <div class="group relative">
        <label
          class=" font-bungee text-lg text-slate-900 underline underline-offset-4 decoration-dotted decoration-orange-600"
          for="lbs"
          >Weight in pounds:
        </label>
        <p
          class="pointer-events-none ml-4 opacity-0 transition-opacity group-hover:opacity-80 bg-teal-300 p-1 rounded no-underline"
        >
          Test
        </p>
      </div>
      <input
        required
        type="number"
        step="0.1"
        bind:value={lbs}
        id="lbs"
        name="lbs"
      />
      <label class="font-bungee text-lg text-slate-900" for="neck">Neck</label>
      <input
        required
        type="number"
        step="0.01"
        bind:value={neck}
        id="neck"
        name="neck"
      />
      <label class="font-bungee text-lg text-slate-900" for="waist"
        >Waist at belly-button in inches:</label
      >
      <input
        required
        type="number"
        step="0.01"
        bind:value={waist}
        id="waist"
        name="waist"
      />
      {#if sex === "Female"}
        <label class="font-bungee text-lg text-slate-900" for="height"
          >Hips in inches:</label
        >
        <input
          required
          type="number"
          step="0.01"
          bind:value={hips}
          id="height"
          name="height"
        />
      {/if}
      <label class="font-bungee text-lg text-slate-900" for="height"
        >Height in inches:</label
      >
      <input
        required
        type="number"
        step="0.01"
        bind:value={height}
        id="height"
        name="height"
      />

      <button
        class=" mt-4 p-4 bg-emerald-200 border-none col-span-2 text-slate-900 text-xl rounded font-bungee"
        type="submit">Calculate Bodyfat Percentage</button
      >
    </form>
  {:else}
    <form on:submit|preventDefault={handleReset}>
      <h2>Bodyfat Percentage: {bodyfatPercentage}%</h2>
      <button type="submit">Reset</button>
    </form>
  {/if}
</main>
<div class="p-10">
  <div class="group relative w-max">
    <button>Click me!</button>
    <span
      class="pointer-events-none absolute -top-7 left-0 w-max opacity-0 transition-opacity group-hover:opacity-100"
    >
      This is a tooltip.
    </span>
  </div>
</div>
