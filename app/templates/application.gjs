import Page from 'example/components/page';

import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Modifier from 'ember-modifier';
import { registerDestructor } from '@ember/destroyable';
import { renderSettled } from '@ember/renderer';
import { on } from '@ember/modifier';

class myModifier extends Modifier {
  constructor() {
    super(...arguments);
    registerDestructor(this, this._tearDown);
  }

  modify(element, positional, named) {
    this.array = named.array;
    console.log('modify', this.array);
    if (!this.didSetup) {
      this._setUp();
    }
  }

  _setUp() {
    console.log('setup');
    this.didSetup = true;
  }

  _tearDown = () => {
    console.log('teardown');
  }
}


class Demo extends Component {
  @tracked enable;
  @tracked array = ['a', 'b', 'c'];

  toggle = () => {
    console.log('toggle');
    this.enable = !this.enable;
  };

  doSomething = () => {
    console.log('do something');
    this.array = [...this.array, 'd'];
  };

  rapidToggle = async (event) => {
    let start = event.currentTarget.closest('div');
     let a = start.querySelector('.a');
    let b = start.querySelector('.b');

    a.click();
    await renderSettled();
    b.click();
    await renderSettled();
    a.click();
    await renderSettled();
    b.click();
    await renderSettled();

  }

  <template>
    <div {{(if @enable (modifier myModifier array=this.array))}}>
      {{#each this.array as |item|}}
        {{item}},
      {{/each}}
    </div>
    <br /><br />
    <button class="a" type="button" {{on "click" this.toggle}}>
      Toggle modifier
    </button>

    <button class="b" type="button" {{on "click" this.doSomething}}>
      Do Something
    </button>

    <hr>

    <button {{on 'click' this.rapidToggle}}>run</button>
  </template>
}

<template>
<Demo />
<hr><hr>

</template>
