{

  inputs.packument.url   = "https://registry.npmjs.org/centra?rev=14-1a69d4a270ed31a52c35f2a21265dfff";
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
    ident = "centra";
    ldir  = "info/unscoped/c/centra";
    inherit packument fetchInfo;
  } // latest';

}
