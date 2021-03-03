import FILE from './FILE';

export default {
  title: 'Design System/Molecules/FILE',
  components: { FILE }
};

const Template = (args, { argTypes }) => ({
  props: Object.keys(argTypes),
  template: '<FILE v-bind="$props" />'
});

export const Default = Template.bind({});
Default.args = {};
