{

  inputs.packument.url   = "https://registry.npmjs.org/yjs?rev=266-f535554164da0b7635b12d150ea812c4";
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
    ident = "yjs";
    ldir  = "info/unscoped/y/yjs";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
