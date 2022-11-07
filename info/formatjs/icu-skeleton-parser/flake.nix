{

  inputs.packument.url   = "https://registry.npmjs.org/@formatjs/icu-skeleton-parser?rev=32-647177c6dcd7ffa89c0af8bf79f7ec32";
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
    scope = "@formatjs";
    ident = "@formatjs/icu-skeleton-parser";
    ldir  = "info/formatjs/icu-skeleton-parser";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
