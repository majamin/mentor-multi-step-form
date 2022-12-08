<!-----------------------------------------------------------------------------
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒                                                                             ▒
▒  Frontend Mentor - multistep-form-F4mdEEDl8o                                ▒
▒                                                                             ▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
------------------------------------------------------------------------------>
<script setup lang="ts">
import BaseInput from "@/components/Base/BaseInput.vue";
import Checkbox from "@/components/AddonsCheckbox.vue";
import Button from "@/components/Base/BaseButton.vue";
import Bubble from "@/components/BubbleStep.vue";
import TierCard from "@/components/TierCard.vue";
import { ref } from "vue";

const userName = ref("");
const userEmail = ref("");
const userTel = ref("");
const step = ref(1);

const plans = [
  {
    title: "arcade",
    monthly: 9,
    annualy: 90,
    imagePath: "src/assets/images/icon-arcade.svg",
  },
  {
    title: "advanced",
    monthly: 12,
    annualy: 120,
    imagePath: "src/assets/images/icon-advanced.svg",
  },
  {
    title: "pro",
    monthly: 15,
    annualy: 150,
    imagePath: "src/assets/images/icon-pro.svg",
  },
];
const planType = ref("monthly");
const planSelection = ref("advanced");

function getPlan(title: string) {
  return plans.filter((e) => {e.title = title})
}

const addOns = ref([
  {
    title: "Online service",
    description: "Access to multiplayer games",
    monthly: 1,
    annualy: 10,
    selected: true,
  },
  {
    title: "Larger storage",
    description: "Extra 1TB of cloud save",
    monthly: 2,
    annualy: 20,
    selected: true,
  },
  {
    title: "Customizable profile",
    description: "Custom theme on your profile",
    monthly: 2,
    annualy: 20,
    selected: false,
  },
]);
</script>

<template>
  <div
    class="container mx-auto flex rounded-lg bg-white p-4 shadow-lg shadow-gray-200"
  >
    <div class="relative">
      <div
        class="flex min-w-[300px] items-center justify-center overflow-hidden"
      >
        <img
          src="@/assets/images/bg-sidebar-desktop.svg"
          class="min-h-full min-w-full shrink-0"
          alt=""
        />
      </div>
      <div class="absolute top-0 left-0 flex p-10 text-white">
        <div class="flex flex-col space-y-8">
          <div class="flex">
            <Bubble :selected="step === 1" @click="step = 1">1</Bubble>
            <div class="ml-4 flex items-center justify-center uppercase">
              Your Info
            </div>
          </div>
          <div class="flex">
            <Bubble :selected="step === 2" @click="step = 2">2</Bubble>
            <div class="ml-4 flex items-center justify-center uppercase">
              Select Plan
            </div>
          </div>
          <div class="flex">
            <Bubble :selected="step === 3" @click="step = 3">3</Bubble>
            <div class="ml-4 flex items-center justify-center uppercase">
              Add-Ons
            </div>
          </div>
          <div class="flex">
            <Bubble :selected="step === 4" @click="step = 4">4</Bubble>
            <div class="ml-4 flex items-center justify-center uppercase">
              Summary
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container flex min-h-max flex-col justify-between px-20 py-12">
      <!-- STEP 1 -->
      <div v-if="step === 1" class="flex flex-col space-y-12">
        <div>
          <div class="mb-2 text-4xl font-black">Personal Info</div>
          <div class="font-light text-cool-gray">
            Please provide your name, email address, and phone number.
          </div>
        </div>
        <div class="flex flex-col">
          <BaseInput class="mb-6" label="Name" v-model="userName" type="text" />
          <BaseInput
            class="mb-6"
            label="Email"
            v-model="userEmail"
            type="email"
          />
          <BaseInput
            class="mb-6"
            label="Phone Number"
            v-model="userTel"
            type="tel"
          />
        </div>
      </div>
      <!-- STEP 2 -->
      <div v-if="step === 2" class="flex flex-col space-y-12">
        <div>
          <div class="mb-2 text-4xl font-black">Select your plan</div>
          <div class="font-light text-cool-gray">
            You have the option of monthly or annual billing.
          </div>
        </div>
        <div class="flex space-x-6">
          <TierCard
            v-for="plan in plans"
            :selected="planSelection === plan.title"
            @click="planSelection = plan.title"
          >
            <template v-slot:icon
              ><img :src="plan.imagePath" :alt="plan.title + ' tier'"
            /></template>
            <template v-slot:title>{{ plan.title }}</template>
            <template v-slot:price
              >${{ planType === "monthly" ? plan.monthly : plan.annualy }}/{{
                planType === "monthly" ? "mo" : "yr"
              }}</template
            >
          </TierCard>
        </div>
        <div class="mx-auto flex">
          <div
            :class="planType === 'monthly' ? 'text-gray-900' : 'text-gray-400'"
            class="mr-3 text-sm font-medium dark:text-gray-300"
          >
            Monthly
          </div>
          <label class="relative inline-flex cursor-pointer items-center">
            <input type="checkbox" value="" class="peer sr-only" checked />
            <div
              :class="
                planType === 'monthly'
                  ? 'after:left-[4px]'
                  : 'after:left-[24px]'
              "
              class="ease h-6 w-11 rounded-full bg-marine-blue transition-all duration-500 after:absolute after:top-1 after:h-4 after:w-4 after:rounded-full after:bg-white after:content-['']"
              @click="
                planType === 'yearly'
                  ? (planType = 'monthly')
                  : (planType = 'yearly')
              "
            ></div>
          </label>
          <div
            :class="planType === 'yearly' ? 'text-gray-900' : 'text-gray-400'"
            class="ml-3 text-sm font-medium text-gray-900 dark:text-gray-300"
          >
            Yearly
          </div>
        </div>
      </div>
      <!-- STEP 3 -->
      <div v-if="step === 3" class="flex flex-col space-y-12">
        <div>
          <div class="mb-2 text-4xl font-black">Pick add-ons</div>
          <div class="font-light text-cool-gray">
            Add-ons help enhance our gaming experience.
          </div>
        </div>
        <div class="flex flex-col space-y-6">
          <Checkbox v-for="addon in addOns" v-model="addon.selected">
            <template v-slot:title>{{ addon.title }}</template>
            <template v-slot:description>{{ addon.description }}</template>
            <template v-slot:price
              >+${{ planType === "monthly" ? addon.monthly : addon.annualy }}/{{
                planType === "monthly" ? "mo" : "yr"
              }}</template
            >
          </Checkbox>
        </div>
      </div>
      <!-- STEP 4 -->
      <div v-if="step === 4" class="flex flex-col space-y-12">
        <div>
          <div class="mb-2 text-4xl font-black">Finishing up</div>
          <div class="font-light text-cool-gray">
            Double-check everything looks OK before continuing.
          </div>
        </div>
        <div v-if="planType === 'monthly'" class="flex flex-col">
          <div class="flex justify-between">
            <div>Arcade ({{ planType }})</div>
            <div></div>
          </div>
          <div class="flex justify-between">
            <div>Change</div>
            <div>${{ 'Figure out how to get prices' }}/mo</div>
          </div>
          <div class="flex justify-between">
            <div>Online service</div>
            <div>+$1/mo</div>
          </div>
          <div class="flex justify-between">
            <div>Larger storage</div>
            <div>+$2/mo</div>
          </div>
          <div class="flex justify-between">
            <div>Total (per month)</div>
            <div>+$12/mo</div>
          </div>
        </div>
      </div>
      <!-- NAVIGATION -->
      <div class="flex justify-between">
        <div v-if="step <= 1"></div>
        <div v-else>
          <Button
            class="text-gray-400 hover:text-current"
            @click="step <= 1 ? (step = 1) : step--"
            >Go Back</Button
          >
        </div>
        <div>
          <Button
            v-if="step < 4"
            class="bg-marine-blue text-white"
            @click="step >= 4 ? (step = 4) : step++"
            >Next Step</Button
          >
          <Button
            v-if="step === 4"
            class="bg-purplish-blue text-white"
            @click=""
            >Confirm</Button
          >
        </div>
      </div>
    </div>
  </div>
</template>
