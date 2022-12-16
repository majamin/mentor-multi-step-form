<script setup lang="ts">
import cardImage from "@/assets/images/icon-arcade.svg";
const { selected } = defineProps({
  selected: { type: Boolean, default: false },
});

</script>
<template>
  <div
    class="ease flex cursor-pointer items-center rounded-lg border-[0.1rem] p-4 align-middle transition-colors duration-200 hover:border-purplish-blue md:min-h-[10rem] md:w-1/3 md:flex-col md:items-start md:justify-between"
    :class="selected ? 'border-purplish-blue' : 'border-light-gray'"
  >
    <div class="w-8">
      <slot name="icon">
        <img :src="cardImage" alt="arcade tier" />
      </slot>
    </div>
    <div class="ml-4 flex flex-col md:ml-0">
      <div class="font-bold"><slot name="title"></slot></div>
      <div class="text-sm font-medium text-gray-400">
        <slot name="price"></slot>
      </div>
    </div>
  </div>
</template>
