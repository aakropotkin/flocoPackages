{

  inputs.packument.url   = "https://registry.npmjs.org/array.prototype.flatmap?rev=16-d6bf023c0bf4ce38e9ba171734f105bb";
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
    ident = "array.prototype.flatmap";
    ldir  = "info/unscoped/a/array.prototype.flatmap";
    inherit packument fetchInfo;
  } // latest';

}
