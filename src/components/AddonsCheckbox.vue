<script setup lang="ts">
import UniqueID from "@/features/UniqueID";

const uuid = UniqueID().getID().toString();

const emit = defineEmits<{
  (e: "update:modelValue", checked: boolean): void;
}>();

defineProps({
  modelValue: {
    type: Boolean,
    default: false,
  },
});
</script>
<template>
  <div
    :class="modelValue ? 'border-purplish-blue' : 'border-gray-300'"
    class="border-box text-slate-500 flex w-full justify-between rounded-md transition-colors duration-300 ease border p-4 text-base outline-none"
  >
    <div class="flex">
      <div class="flex justify-center align-middle">
        <input
          :checked="modelValue"
          :id="uuid"
          type="checkbox"
          @change="
            emit(
              'update:modelValue',
              ($event.target as HTMLInputElement).checked
            )
          "
          class="mr-5"
        />
      </div>
      <div class="flex flex-col">
        <label :for="uuid">
          <div class="text-lg font-medium"><slot name="title">Title</slot></div>
          <div class="text-gray-400">
            <slot name="description">Description</slot>
          </div>
        </label>
      </div>
    </div>
    <div class="flex flex-col justify-center align-middle text-purplish-blue">
      <slot name="price">$0.99</slot>
    </div>
  </div>
  <!-- <p class="h-1.5 text-xs text-theme-red-500"> -->
  <!--   {{ error }} -->
  <!-- </p> -->
</template>
