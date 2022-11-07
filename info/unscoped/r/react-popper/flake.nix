{

  inputs.packument.url   = "https://registry.npmjs.org/react-popper?rev=85-b3d9e702129a9d23497f474f8c294052";
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
    ident = "react-popper";
    ldir  = "info/unscoped/r/react-popper";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
