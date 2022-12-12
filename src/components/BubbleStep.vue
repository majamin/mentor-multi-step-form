<script setup lang="ts">
const { selected } = defineProps({
  selected: { type: Boolean, default: false },
});
</script>
<template>
  <div
    :class="
      selected ? 'bg-light-blue text-marine-blue' : 'bg-transparent text-white'
    "
    class="flex h-8 w-8 flex-col items-center justify-center rounded-full border border-gray-300 text-sm font-bold"
  >
    <slot></slot>
  </div>
</template>
