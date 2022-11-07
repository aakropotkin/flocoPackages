{

  inputs.packument.url   = "https://registry.npmjs.org/three?rev=518-cd9c396c7ba18df8b73338d07e1eb3a6";
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
    ident = "three";
    ldir  = "info/unscoped/t/three";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
