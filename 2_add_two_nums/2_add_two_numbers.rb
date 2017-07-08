# Definition for singly-linked list.
#
class ListNode
    attr_accessor :val, :next
    def initialize(val)
        @val = val
        @next = nil
    end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  tens_power = 0

  n1 = 0
  n2 = 0
  while(l1) do
    n1 += l1.val * (10 ** tens_power)
    l1 = l1.next
    tens_power += 1
  end

  tens_power = 0
  while(l2) do
    n2 += l2.val * (10 ** tens_power)
    l2 = l2.next
    tens_power += 1
  end

  sum = n1 + n2
  digits = []

  while(sum > 0) do
    digits << sum % 10
    sum = sum / 10
  end

  if digits.size > 1
    ret = digits.map do |digit|
            ListNode.new(digit)
          end

    ret_size = ret.size()
    (0..ret.size - 1).each do |index|
      ret[index].next = ret[index + 1]
    end
  else
    ListNode.new(digits[0])
  end
  ret[0]
end

new_list = [1,2,3].map do |val|
      ListNode.new(val)
    end

(0..1).each do |index|
  new_list[index].next = new_list[index + 1]
end

print new_list
add_two_numbers(new_list[0], new_list[0])

sec_new_list = [0].map do |val|
                  ListNode.new(val)
                end
add_two_numbers(sec_new_list[0], sec_new_list[0])
