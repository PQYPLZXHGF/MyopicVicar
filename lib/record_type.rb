# Copyright 2012 Trustees of FreeBMD
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
module RecordType

  BURIAL = 'bu'
  MARRIAGE = 'ma'
  BAPTISM = 'ba'

  CENSUS_1841 = '1841'
  CENSUS_1851 = '1851'
  CENSUS_1861 = '1861'
  CENSUS_1871 = '1871'
  CENSUS_1881 = '1881'
  CENSUS_1891 = '1891'

  BIRTHS    = 1
  DEATHS    = 2
  MARRIAGES = 3

  def self.all_types
    ("RecordType::#{all_types_constant}").constantize
    case MyopicVicar::Application.config.template_set
    when 'freereg'
      ALL_FREEREG_TYPES
    when 'freecen'
      ALL_FREECEN_TYPES
    when 'freebmd'
      ALL_FREEBMD_TYPES
    end
  end

  def self.options
    case MyopicVicar::Application.config.template_set
    when 'freereg'
      FREEREG_OPTIONS
    when 'freecen'
      FREECEN_OPTIONS
    when 'freebmd'
      FREEBMD_OPTIONS
    end
  end
  
  def self.display_name(value)
    # binding.pry
    self.options.key(value)
  end

  ALL_FREEREG_TYPES = [BURIAL, MARRIAGE, BAPTISM]
  ALL_FREECEN_TYPES = [CENSUS_1841, CENSUS_1851, CENSUS_1861, CENSUS_1871, CENSUS_1881, CENSUS_1891]
  ALL_FREEBMD_TYPES = [BIRTHS, DEATHS, MARRIAGES]

  def self.all_types_constant
    ("ALL_#{MyopicVicar::Application.config.template_set}_types").upcase
  end

  private
  FREEREG_OPTIONS = {
    'Baptism' => BAPTISM,
    'Marriage' => MARRIAGE,
    'Burial' => BURIAL
  }

  FREECEN_OPTIONS = ALL_FREECEN_TYPES.inject({}) do |accum, value|
    accum[value]=value
    accum
  end

  FREEBMD_OPTIONS = {
    'BIRTHS' => BIRTHS,
    'DEATHS' => DEATHS,
    'MARRIAGES' => MARRIAGES
  }

end
