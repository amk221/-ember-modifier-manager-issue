import Modifier from 'ember-modifier';
import { registerDestructor } from '@ember/destroyable';

export default class MyModifier extends Modifier {
  constructor() {
    super(...arguments);
    registerDestructor(this, () => this._tearDown());
  }

  modify(element, positional, named) {
    console.log('modify', named.array);

    if (!this.didSetup) {
      this._setUp();
    }
  }

  _setUp = () => {
    console.log('setup');

    this.didSetup = true;
  }

  _tearDown = () => {
    console.log('teardown');
  }
}
