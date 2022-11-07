{

  inputs.packument.url   = "https://registry.npmjs.org/path-posix?rev=7-ee510985f63472ce310077e2f03091c0";
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
    ident = "path-posix";
    ldir  = "info/unscoped/p/path-posix";
    inherit packument fetchInfo;
  } // latest';

}
