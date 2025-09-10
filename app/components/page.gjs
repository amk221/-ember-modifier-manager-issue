import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import Items from 'example/components/items';

export default class extends Component {
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

  <template>
    <Items
      @enable={{this.enable}}
      @array={{this.array}}
      @onToggle={{this.toggle}}
      @onDoSomething={{this.doSomething}}
    />
  </template>
}
