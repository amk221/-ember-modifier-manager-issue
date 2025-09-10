import Controller from '@ember/controller';
import { tracked } from '@glimmer/tracking';

export default class ApplicationController extends Controller {
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
}
