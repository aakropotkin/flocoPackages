{

  inputs.packument.url   = "https://registry.npmjs.org/path-exists?rev=23-ee4daef015e0d3cd003946a0749cffba";
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
    ident = "path-exists";
    ldir  = "info/unscoped/p/path-exists";
    inherit packument fetchInfo;
  } // latest';

}
