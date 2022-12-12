<script setup lang="ts">
const { selected } = defineProps({
  selected: { type: Boolean, default: false },
});

import cardImage from "@/assets/images/icon-arcade.svg"

</script>
<template>
  <div
    class="ease flex min-h-[10rem] w-1/3 cursor-pointer flex-col justify-between rounded-lg border-[0.1rem] p-4 transition-colors duration-200 hover:border-purplish-blue"
    :class="selected ? 'border-purplish-blue' : 'border-light-gray'"
  >
    <div class="w-8">
      <slot name="icon">
        <img :src="cardImage" alt="arcade tier" />
      </slot>
    </div>
    <div class="flex flex-col">
      <div class="font-bold"><slot name="title"></slot></div>
      <div class="text-sm font-medium text-gray-400">
        <slot name="price"></slot>
      </div>
    </div>
  </div>
</template>
