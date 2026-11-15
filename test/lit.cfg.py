import os
import lit.formats

config.name = 'PCCC'

config.test_format = lit.formats.ShTest(execute_external=False)

config.suffixes = ['.mlir', '.cpp']
config.test_source_root = os.path.dirname(__file__)
config.test_exec_root = os.path.join(config.pccc_obj_root, 'test')

config.substitutions.append(('%pccc-opt', os.path.join(config.pccc_tools_dir, 'pccc-opt')))
config.substitutions.append(('%mlir-opt', os.path.join(config.mlir_tools_dir, 'mlir-opt')))
config.substitutions.append(('%FileCheck', os.path.join(config.llvm_tools_dir, 'FileCheck')))

config.environment['PATH'] = os.pathsep.join([
    config.pccc_tools_dir,
    config.mlir_tools_dir,
    config.llvm_tools_dir,
    config.environment.get('PATH', '')
])
