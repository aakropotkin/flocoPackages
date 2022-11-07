{

  inputs.packument.url   = "https://registry.npmjs.org/react-dnd?rev=235-64e29478f7660a620fd3aa9d0a8b5e19";
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
    ident = "react-dnd";
    ldir  = "info/unscoped/r/react-dnd";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
