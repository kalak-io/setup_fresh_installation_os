import { mount } from "@vue/test-utils";
import FILE from './FILE';

describe('FILE', () => {
  const factory = () => mount(FILE);

  it('mounts properly', () => {
    const wrapper = factory();
    expect(wrapper.findComponent(FILE).exists()).toBeTruthy();
  });

  it('renders properly', () => {
    const wrapper = factory();
    expect(wrapper.html()).toMatchSnapshot();
  });
});
