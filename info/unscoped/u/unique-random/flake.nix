{

  inputs.packument.url   = "https://registry.npmjs.org/unique-random?rev=17-49c5ec5ea7bdb12f36003939673d202f";
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
    ident = "unique-random";
    ldir  = "info/unscoped/u/unique-random";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
