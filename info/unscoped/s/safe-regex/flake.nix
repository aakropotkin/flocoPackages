{

  inputs.packument.url   = "https://registry.npmjs.org/safe-regex?rev=42-a2680c369396f4278e09d62f967f5aa2";
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
    ident = "safe-regex";
    ldir  = "info/unscoped/s/safe-regex";
    inherit packument fetchInfo;
  } // latest';

}
