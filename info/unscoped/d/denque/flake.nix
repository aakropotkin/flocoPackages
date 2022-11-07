{

  inputs.packument.url   = "https://registry.npmjs.org/denque?rev=32-c44c0bba6d95174fbf58d0cd70870615";
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
    ident = "denque";
    ldir  = "info/unscoped/d/denque";
    inherit packument fetchInfo;
  } // latest';

}
