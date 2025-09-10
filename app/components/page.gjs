import myModifier from 'example/modifiers/my-modifier';
import { on } from '@ember/modifier';

<template>
  <div {{(if @enable (modifier myModifier array=@array))}}>
    {{#each @array as |item|}}
      {{item}},
    {{/each}}
  </div>

  <br /><br />

  <button class="a" type="button" {{on "click" @onToggle}}>
    Toggle modifier
  </button>

  <button class="b" type="button" {{on "click" @onDoSomething}}>
    Do Something
  </button>
</template>
