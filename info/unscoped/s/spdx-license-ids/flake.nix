{

  inputs.packument.url   = "https://registry.npmjs.org/spdx-license-ids?rev=30-e9679dc6d335c6e77e3be68697ca7e2a";
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
    ident = "spdx-license-ids";
    ldir  = "info/unscoped/s/spdx-license-ids";
    inherit packument fetchInfo;
  } // latest';

}
