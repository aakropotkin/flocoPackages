{

  inputs.packument.url   = "https://registry.npmjs.org/xpath.js?rev=24-dbe9c20cad579087b55c7da6cdac46dc";
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
    ident = "xpath.js";
    ldir  = "info/unscoped/x/xpath.js";
    inherit packument fetchInfo;
  } // latest';

}
