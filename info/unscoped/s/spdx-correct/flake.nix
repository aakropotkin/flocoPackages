{

  inputs.packument.url   = "https://registry.npmjs.org/spdx-correct?rev=22-4cffd58cc19a0d60a875a5db963eda41";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "spdx-correct";
    ldir  = "info/unscoped/s/spdx-correct";
    inherit packument fetchInfo;
  } // latest';

}
