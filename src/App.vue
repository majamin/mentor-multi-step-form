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
const planSelection = ref(1);
const planType = ref(0);
const onlineServices = ref(true);
const largerStorage = ref(true);
const customProfile = ref(false);
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
          <TierCard :selected="planSelection === 1" @click="planSelection = 1">
            <template v-slot:icon
              ><img src="@/assets/images/icon-arcade.svg" alt="arcade tier"
            /></template>
            <template v-slot:title>Arcade</template>
            <template v-slot:price>$9/month</template>
          </TierCard>
          <TierCard :selected="planSelection === 2" @click="planSelection = 2">
            <template v-slot:icon
              ><img src="@/assets/images/icon-advanced.svg" alt="arcade tier"
            /></template>
            <template v-slot:title>Advanced</template>
            <template v-slot:price>$12/month</template>
          </TierCard>
          <TierCard :selected="planSelection === 3" @click="planSelection = 3">
            <template v-slot:icon
              ><img src="@/assets/images/icon-pro.svg" alt="arcade tier"
            /></template>
            <template v-slot:title>Pro</template>
            <template v-slot:price>$15/month</template>
          </TierCard>
        </div>
        <div class="mx-auto flex">
          <div
            :class="planType === 0 ? 'text-gray-900' : 'text-gray-400'"
            class="mr-3 text-sm font-medium dark:text-gray-300"
          >
            Monthly
          </div>
          <label class="relative inline-flex cursor-pointer items-center">
            <input type="checkbox" value="" class="peer sr-only" checked />
            <div
              :class="planType === 0 ? 'after:left-[4px]' : 'after:left-[24px]'"
              class="ease h-6 w-11 rounded-full bg-marine-blue transition-all duration-500 after:absolute after:top-1 after:h-4 after:w-4 after:rounded-full after:bg-white after:content-['']"
              @click="planType = (planType + 1) % 2"
            ></div>
          </label>
          <div
            :class="planType === 1 ? 'text-gray-900' : 'text-gray-400'"
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
          <Checkbox v-model="onlineServices">
            <template v-slot:title>Online service</template>
            <template v-slot:description>Access to multiplayer games</template>
            <template v-slot:price>+$10/yr</template>
          </Checkbox>
          <Checkbox v-model="largerStorage">
            <template v-slot:title>Larger storage</template>
            <template v-slot:description>Extra 1TB of cloud save</template>
            <template v-slot:price>+$20/yr</template>
          </Checkbox>
          <Checkbox v-model="customProfile">
            <template v-slot:title>Customizable profile</template>
            <template v-slot:description>Custom theme on your profile</template>
            <template v-slot:price>+$20/yr</template>
          </Checkbox>
        </div>
      </div>
      <!-- STEP 4 -->
      <div v-if="step === 4">Step 4</div>
      <div class="flex justify-between">
        <div v-if="step <= 1"></div>
        <div v-else>
          <Button @click="step <= 1 ? (step = 1) : step--">Go Back</Button>
        </div>
        <div>
          <Button
            class="bg-marine-blue text-white"
            @click="step >= 4 ? (step = 4) : step++"
            >Next Step</Button
          >
        </div>
      </div>
    </div>
  </div>
</template>
