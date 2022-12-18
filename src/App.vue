<!-----------------------------------------------------------------------------
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒                                                                             ▒
▒  Frontend Mentor Challenge - multi-step-form                                ▒
▒                                                                             ▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
------------------------------------------------------------------------------>
<script setup lang="ts">
import BaseInput from "@/components/Base/BaseInput.vue";
import Checkbox from "@/components/AddonsCheckbox.vue";
import Button from "@/components/Base/BaseButton.vue";
import Bubble from "@/components/BubbleStep.vue";
import TierCard from "@/components/TierCard.vue";
import { ref, computed } from "vue";

const step = ref(1);

type PlanTier = "Arcade" | "Advanced" | "Pro";
type PlanDuration = "Monthly" | "Annual";
const planTierSelected = ref<PlanTier>("Arcade");
const planDuration = ref<PlanDuration>("Monthly");

const calcPrice = computed(() => {
  if (planDuration.value === "Monthly") {
    let plan = plans.find((e) => e.tier === planTierSelected.value);
    let addOnsCosts = addOns.value
      .filter((e) => e.selected)
      .map((value) => value.monthly);
    if (plan) {
      return plan.monthly + addOnsCosts.reduce((s, x) => s + x);
    }
  } else if (planDuration.value === "Annual") {
    let plan = plans.find((e) => e.tier === planTierSelected.value);
    let addOnsCosts = addOns.value
      .filter((e) => e.selected)
      .map((value) => value.annualy);
    if (plan) {
      return plan.annualy + addOnsCosts.reduce((s, x) => s + x);
    }
  }
});

interface User {
  name: string;
  email: string;
  tel: string;
}

const user = ref<User>({
  name: "",
  email: "",
  tel: "",
});

interface Plan {
  tier: PlanTier;
  annualy: number;
  monthly: number;
  img: string | undefined;
}

const plans: Plan[] = [
  {
    tier: "Arcade",
    monthly: 9,
    annualy: 90,
    img: "/images/icon-arcade.svg",
  },
  {
    tier: "Advanced",
    monthly: 12,
    annualy: 120,
    img: "/images/icon-advanced.svg",
  },
  {
    tier: "Pro",
    monthly: 15,
    annualy: 150,
    img: "/images/icon-pro.svg",
  },
];

interface AddonPlan {
  title: string;
  description: string;
  monthly: number;
  annualy: number;
  selected: boolean;
}

const addOns = ref<AddonPlan[]>([
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
    class="mx-auto flex flex-col rounded-lg bg-magnolia shadow-gray-200 md:container md:flex-row md:bg-white md:p-4 md:shadow-lg"
  >
    <div class="relative">
      <div
        class="flex items-center justify-center overflow-hidden md:min-w-[300px]"
      >
        <img
          src="@/assets/images/bg-sidebar-mobile.svg"
          class="min-h-full min-w-full shrink-0 md:hidden"
          alt=""
        />
        <img
          src="@/assets/images/bg-sidebar-desktop.svg"
          class="hidden min-h-full min-w-full shrink-0 md:block"
          alt=""
        />
      </div>
      <div class="absolute top-0 left-0 flex w-full p-10 text-white">
        <div
          class="flex w-full flex-row justify-evenly md:flex-col md:space-y-8"
        >
          <div
            class="flex cursor-pointer items-center align-middle"
            @click="step = 1"
          >
            <Bubble :selected="step === 1">1</Bubble>
            <div
              class="ml-4 hidden uppercase md:flex md:flex-col md:justify-center"
            >
              <div class="text-sm text-gray-400">Step 1</div>
              <div class="flex items-center">Your Info</div>
            </div>
          </div>
          <div
            class="flex cursor-pointer items-center align-middle"
            @click="step = 2"
          >
            <Bubble :selected="step === 2">2</Bubble>
            <div
              class="ml-4 hidden uppercase md:flex md:flex-col md:justify-center"
            >
              <div class="text-sm text-gray-400">Step 2</div>
              <div class="flex items-center">Select Plan</div>
            </div>
          </div>
          <div
            class="flex cursor-pointer items-center align-middle"
            @click="step = 3"
          >
            <Bubble :selected="step === 3">3</Bubble>
            <div
              class="ml-4 hidden uppercase md:flex md:flex-col md:justify-center"
            >
              <div class="text-sm text-gray-400">Step 3</div>
              <div class="flex items-center">Add-Ons</div>
            </div>
          </div>
          <div class="flex cursor-pointer items-center align-middle">
            <Bubble :selected="step >= 4">4</Bubble>
            <div
              class="ml-4 hidden uppercase md:flex md:flex-col md:justify-center"
            >
              <div class="text-sm text-gray-400">Step 4</div>
              <div class="flex items-center">Summary</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="flex flex-col w-full justify-between bg-magnolia md:bg-white">
      <div
        class="relative mx-4 flex min-h-max flex-col justify-between rounded-md bg-white p-6 shadow-xl shadow-gray-200 xs:top-[-5rem] sm:top-[-8rem] md:container md:top-0 md:shadow-none lg:p-24"
      >
        <!-- STEP 1 -->
        <div v-if="step === 1" class="flex flex-col space-y-12">
          <div>
            <div class="mb-2 text-4xl font-black">Personal Info</div>
            <div class="font-light text-cool-gray">
              Please provide your name, email address, and phone number.
            </div>
          </div>
          <div class="flex flex-col">
            <BaseInput
              class="mb-6"
              label="Name"
              v-model="user.name"
              type="text"
            />
            <BaseInput
              class="mb-6"
              label="Email"
              v-model="user.email"
              type="email"
            />
            <BaseInput
              class="mb-6"
              label="Phone Number"
              v-model="user.tel"
              type="tel"
            />
          </div>
        </div>
        <!-- STEP 2 -->
        <div v-if="step === 2" class="flex flex-col space-y-12">
          <div class="md:mx-20">
            <div class="mb-2 text-4xl font-black">Select your plan</div>
            <div class="font-light text-cool-gray">
              You have the option of monthly or annual billing.
            </div>
          </div>
          <div
            class="flex flex-col space-x-0 space-y-2 md:mx-20 md:flex-row md:space-x-6 md:space-y-0"
          >
            <TierCard
              v-for="plan in plans"
              :selected="plan.tier == planTierSelected"
              @click="planTierSelected = plan.tier"
            >
              <template v-slot:icon
                ><img :src="plan.img" :alt="plan.tier + ' tier'"
              /></template>
              <template v-slot:title>{{ plan.tier }}</template>
              <template v-slot:price
                >${{
                  planDuration === "Monthly" ? plan.monthly : plan.annualy
                }}/{{ planDuration === "Monthly" ? "mo" : "yr" }}</template
              >
            </TierCard>
          </div>
          <div class="mx-auto flex">
            <div
              :class="
                planDuration === 'Monthly' ? 'text-gray-900' : 'text-gray-400'
              "
              class="mr-3 text-sm font-medium dark:text-gray-300"
            >
              Monthly
            </div>
            <label
              class="relative mb-10 inline-flex cursor-pointer items-center"
            >
              <input type="checkbox" value="" class="peer sr-only" checked />
              <div
                :class="
                  planDuration === 'Monthly'
                    ? 'after:left-[4px]'
                    : 'after:left-[24px]'
                "
                class="ease h-6 w-11 rounded-full bg-marine-blue transition-all duration-500 after:absolute after:top-1 after:h-4 after:w-4 after:rounded-full after:bg-white after:content-['']"
                @click="
                  planDuration === 'Annual'
                    ? (planDuration = 'Monthly')
                    : (planDuration = 'Annual')
                "
              ></div>
            </label>
            <div
              :class="
                planDuration === 'Annual' ? 'text-gray-900' : 'text-gray-400'
              "
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
                >+${{
                  planDuration === "Monthly" ? addon.monthly : addon.annualy
                }}/{{ planDuration === "Monthly" ? "mo" : "yr" }}</template
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
          <div class="flex flex-col">
            <div class="flex flex-col">
              <div>
                {{ planTierSelected }} ({{
                  planDuration === "Annual" ? "Yearly" : planDuration
                }})
              </div>
              <div class="flex justify-between">
                <div class="text-cool-gray underline">Change</div>
                <div v-if="planDuration === 'Monthly'">
                  +${{
                    plans.find((e) => e.tier === planTierSelected)?.monthly
                  }}/mo
                </div>
                <div v-else>
                  +${{
                    plans.find((e) => e.tier === planTierSelected)?.annualy
                  }}/yr
                </div>
              </div>
            </div>
            <hr class="my-6 h-px border-0 bg-gray-200 dark:bg-gray-700" />
            <div>
              <div
                v-for="addon in addOns.filter((e) => e.selected)"
                class="mb-2 flex justify-between"
              >
                <div class="text-cool-gray">{{ addon.title }}</div>
                <div v-if="planDuration === 'Monthly'">
                  +${{ addon.monthly }}/mo
                </div>
                <div v-else>+${{ addon.annualy }}/yr</div>
              </div>
            </div>
            <div class="mt-4 flex justify-between">
              <div class="text-cool-gray">
                Total (per {{ planDuration === "Monthly" ? "month" : "year" }})
              </div>
              <div class="text-lg font-bold text-purplish-blue">
                +${{ calcPrice }}/{{ planDuration === "Monthly" ? "mo" : "yr" }}
              </div>
            </div>
          </div>
        </div>
        <!-- STEP 5 (CONFIRM) -->
        <div
          v-if="step === 5"
          class="my-auto flex flex-col items-center space-y-8 text-center align-middle"
        >
          <div>
            <img src="/images/icon-thank-you.svg" alt="thank you" />
          </div>
          <div class="text-2xl font-bold text-marine-blue">Thank you!</div>
          <div class="text-cool-gray">
            Thanks for confirming your subscription! We hope you have fun using
            our platform. If you ever need support, please feel free to email us
            at <a href="#">support@loremgaming.com</a>
          </div>
        </div>
      </div>
      <!-- NAVIGATION -->
      <div
        :class="step > 4 ? 'bg-magnolia' : 'bg-white'"
        class="absolute bottom-0 flex w-full justify-between p-4 md:relative md:ml-4 md:mt-0"
      >
        <div v-if="step <= 1 || step > 4"></div>
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
            @click="step += 1"
            >Confirm</Button
          >
        </div>
      </div>
    </div>
  </div>
</template>
