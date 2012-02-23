p "Namespace illustrated with constants"

module M
  class C
    X = 'constant'
  end
  C::X # => "constant"
end
M::C::X # => "constant"

p "If you’re sitting deep inside the tree of constants"
p "you can provide the absolute path to an outer constant by using a leading double colon as root"

module M
  Y = 'another constant'
  class C
    ::M::Y	# => "another constant"
  end
end

M.constants # => [:C, :Y]

p "Finally, if you need the current path, check out Module.nesting()"

module M
  class C
    module M2
      Module.nesting
    end
  end
end    #  => [M::C::M2, M::C, M]