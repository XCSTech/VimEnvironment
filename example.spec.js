import { shallowMount } from '@vue/test-utils'
import HelloWorld from '@/components/HelloWorld.vue'

describe('HelloWorld.vue', () => {
  it('renders props.msg when passed', () => {
    const msg = 'new message'
    const wrapper = shallowMount(HelloWorld, {
      propsData: { msg }
    })
    expect(wrapper.text()).toMatch(msg)
  })

  const wrapper = shallowMount(HelloWorld)
  it('my own', () => {
	wrapper.setData({stuff:'hey'})
      expect(wrapper.vm.minec).toBe(true);
  })
  it('data set', () => {
    wrapper.setData({stuff:'hey'})
    expect(wrapper.vm.stuff).toBe('hey')
  })
})
