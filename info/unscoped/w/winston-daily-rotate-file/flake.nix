{

  inputs.packument.url   = "https://registry.npmjs.org/winston-daily-rotate-file?rev=111-61b2d556a92ac49edfa30c29894e628c";
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
    ident = "winston-daily-rotate-file";
    ldir  = "info/unscoped/w/winston-daily-rotate-file";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
