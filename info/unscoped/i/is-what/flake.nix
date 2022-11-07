{

  inputs.packument.url   = "https://registry.npmjs.org/is-what?rev=54-723d618ffa1b0b1299366689dda354e2";
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
    ident = "is-what";
    ldir  = "info/unscoped/i/is-what";
    inherit packument fetchInfo;
  } // latest';

}
