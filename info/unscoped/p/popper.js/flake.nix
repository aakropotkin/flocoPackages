{

  inputs.packument.url   = "https://registry.npmjs.org/popper.js?rev=149-456deee688f1f642fc5e4c1599815a4e";
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
    ident = "popper.js";
    ldir  = "info/unscoped/p/popper.js";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
