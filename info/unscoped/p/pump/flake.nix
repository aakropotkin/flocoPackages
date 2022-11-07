{

  inputs.packument.url   = "https://registry.npmjs.org/pump?rev=127-71f625e1b3405e8e940e26c218d8a20e";
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
    ident = "pump";
    ldir  = "info/unscoped/p/pump";
    inherit packument fetchInfo;
  } // latest';

}
