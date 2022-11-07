{

  inputs.packument.url   = "https://registry.npmjs.org/which-collection?rev=4-81e5ea5ff321abb9addbf32a6ab13391";
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
    ident = "which-collection";
    ldir  = "info/unscoped/w/which-collection";
    inherit packument fetchInfo;
  } // latest';

}
