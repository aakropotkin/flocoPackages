{

  inputs.packument.url   = "https://registry.npmjs.org/connect-mongo?rev=236-f149288bf78254e6f41d2bcd9a855e46";
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
    ident = "connect-mongo";
    ldir  = "info/unscoped/c/connect-mongo";
    inherit packument fetchInfo;
  } // latest';

}
