{

  inputs.packument.url   = "https://registry.npmjs.org/fast-fifo?rev=2-56a8f2a6cd6800153166e510cfe51327";
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
    ident = "fast-fifo";
    ldir  = "info/unscoped/f/fast-fifo";
    inherit packument fetchInfo;
  } // latest';

}
