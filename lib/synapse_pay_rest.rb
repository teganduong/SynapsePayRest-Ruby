# client classes
require 'synapse_pay_rest/client'
require 'synapse_pay_rest/http_client'

# base API classes
require 'synapse_pay_rest/api/users'
require 'synapse_pay_rest/api/nodes'
require 'synapse_pay_rest/api/transactions'

# general library classes
require 'synapse_pay_rest/error'
require 'synapse_pay_rest/version'

# user-related classes
require 'synapse_pay_rest/models/user/user'
require 'synapse_pay_rest/models/user/base_document'
require 'synapse_pay_rest/models/user/document'
require 'synapse_pay_rest/models/user/physical_document'
require 'synapse_pay_rest/models/user/social_document'
require 'synapse_pay_rest/models/user/virtual_document'
require 'synapse_pay_rest/models/user/question'

# node-related classes

# ancestor of all node classes
require 'synapse_pay_rest/models/node/base_node'

# BaseNode subclasses
# synapse
require 'synapse_pay_rest/models/node/synapse_us_node.rb'
require 'synapse_pay_rest/models/node/synapse_ind_node.rb'
require 'synapse_pay_rest/models/node/synapse_np_node.rb'
# ach
require 'synapse_pay_rest/models/node/ach_us_node.rb'
require 'synapse_pay_rest/models/node/unverified_node.rb'
# eft
require 'synapse_pay_rest/models/node/eft_ind_node.rb'
require 'synapse_pay_rest/models/node/eft_np_node.rb'
# wire
require 'synapse_pay_rest/models/node/wire_us_node.rb'
require 'synapse_pay_rest/models/node/wire_int_node.rb'
# reserve
require 'synapse_pay_rest/models/node/reserve_us_node.rb'
# triump subaccount
require 'synapse_pay_rest/models/node/triumph_subaccount_us_node.rb'
# iou
require 'synapse_pay_rest/models/node/iou_node.rb'

# BaseNode factory
require 'synapse_pay_rest/models/node/node'

# transaction-related classes
require 'synapse_pay_rest/models/transaction/transaction'

# Namespace for all SynapsePayRest classes and modules
module SynapsePayRest
  # Modifies the default method to print a warning when deprecated constants
  # used and returns the new constant.
  #
  # @param [Constant]
  # @return [Constant] the corresponding constant that is not deprecated.
  def self.const_missing(const_name)
    super unless const_name == :Trans
    warn caller.first + " DEPRECATION WARNING: the class SynapsePayRest::#{const_name}"\
                        'is deprecated. Use SynapsePayRest::Transactions instead.'
    Transactions
  end
end
