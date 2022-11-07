{

  inputs.packument.url   = "https://registry.npmjs.org/p-limit?rev=26-cc4584efa8dbfb787dbbb44f483e4dcd";
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
    ident = "p-limit";
    ldir  = "info/unscoped/p/p-limit";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
